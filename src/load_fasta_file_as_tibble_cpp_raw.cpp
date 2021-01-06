#include <Rcpp.h>
#include <cassert>
#include <string>
#include <fstream>
using namespace Rcpp;

//' Do it
//' @param fasta_filename FASTA filename
//' @return characters in each element of the vector
// [[Rcpp::export]]
Rcpp::List load_fasta_file_as_tibble_cpp_raw(const Rcpp::String& fasta_filename) {
  // 2 columns
  Rcpp::List my_list(2);

  Rcpp::CharacterVector names(2);
  names[0] = "name";
  names[1] = "sequence";
  my_list.attr("names") = names;

  Rcpp::CharacterVector protein_names;
  Rcpp::CharacterVector sequences;

  std::ifstream in(fasta_filename.get_cstring());

  enum class state_type { need_name, need_sequence, reading_sequence };
  state_type state = state_type::need_name;
  std::string sequence = "";

  for (int i=0; !in.eof(); ++i)
  {
    std::string s;
    std::getline(in,s);

    if (state == state_type::need_name)
    {
      if (s.empty()) continue;
      assert(s[0] == '>');
      sequence = ""; // Reset
      state = state_type::need_sequence;
      protein_names.push_back(s.substr(1, s.size() - 1));
      continue;
    } else if (state == state_type::need_sequence) {
      assert(s[0] != '>');
      assert(sequence == "");
      sequence = s;
      state = state_type::reading_sequence;
    } else {
      assert(state == state_type::reading_sequence);
      if (s[0] == '>') {
        // Found a new gene
        sequences.push_back(sequence); // Add sequence
        sequence = "";
        state = state_type::need_sequence;
        protein_names.push_back(s.substr(1, s.size() - 1));
      } else {
        // Add to sequence
        sequence += s;
      }
    }
  }
  sequences.push_back(sequence);

  my_list[0] = protein_names;
  my_list[1] = sequences;

  my_list.attr("class") = Rcpp::CharacterVector::create("data.table", "data.frame");
  return my_list;
}
