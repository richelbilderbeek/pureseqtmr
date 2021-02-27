#include "load_fasta_file_as_tibble_cpp_stl.h"

#include <cassert>
#include <fstream>
#include <stdexcept>

bool file_exists(const std::string& filename)
{
  std::fstream f;
  f.open(filename.c_str(),std::ios::in);
  return f.is_open();
}

std::pair<std::vector<std::string>, std::vector<std::string>>
  load_fasta_file_as_tibble_cpp_stl(const std::string& fasta_filename)
{
  if (!file_exists(fasta_filename)) {
    throw std::runtime_error(
      "FASTA file not found at path " + fasta_filename
    );
  }
  std::vector<std::string> protein_names;
  std::vector<std::string> sequences;

  std::ifstream in(fasta_filename);

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
      if (s[0] != '>')
      {
        throw std::runtime_error(
          "Invalid FASTA file: expected a line starting with '>' in line " + std::to_string(i + 1)
        );
      }
      sequence = ""; // Reset
      state = state_type::need_sequence;
      protein_names.push_back(s.substr(1, s.size() - 1));
      continue;
    } else if (state == state_type::need_sequence) {
      if (s[0] == '>')
      {
        throw std::runtime_error(
          "Invalid FASTA file: second consecutive line starting with '>' in line " + std::to_string(i + 1)
        );
      }
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

  // Add the current sequence
  if (!protein_names.empty())
  {
    sequences.push_back(sequence);
  }
  assert(protein_names.size() == sequences.size());

  return std::make_pair(protein_names, sequences);
}
