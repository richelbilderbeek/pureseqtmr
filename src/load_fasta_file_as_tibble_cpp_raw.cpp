#include <cassert>
#include <string>
#include <fstream>
//using namespace Rcpp;

#include <string>
#include <utility>
#include <vector>

#include "load_fasta_file_as_tibble_cpp_stl.h"
#include "load_fasta_file_as_tibble_cpp_raw.h"

Rcpp::List load_fasta_file_as_tibble_cpp_raw(const Rcpp::String& fasta_filename)
{
  // 2 columns
  Rcpp::List my_list(2);

  Rcpp::CharacterVector names(2);
  names[0] = "name";
  names[1] = "sequence";
  my_list.attr("names") = names;

  const std::pair<std::vector<std::string>, std::vector<std::string>> p =
    load_fasta_file_as_tibble_cpp_stl(fasta_filename.get_cstring());

  my_list[0] = p.first;
  my_list[1] = p.second;

  my_list.attr("class") = Rcpp::CharacterVector::create(
    "data.table", "data.frame"
  );
  return my_list;
}
