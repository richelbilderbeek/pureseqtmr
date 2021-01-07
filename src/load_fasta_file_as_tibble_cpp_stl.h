#ifndef LOAD_FASTA_FILE_AS_TIBBLE_CPP_STL
#define LOAD_FASTA_FILE_AS_TIBBLE_CPP_STL

#include <string>
#include <utility>
#include <vector>

// Do not export, as Rcpp cannot handle the return type
std::pair<std::vector<std::string>, std::vector<std::string>>
  load_fasta_file_as_tibble_cpp_stl(const std::string& fasta_filename)
;

#endif // LOAD_FASTA_FILE_AS_TIBBLE_CPP_STL
