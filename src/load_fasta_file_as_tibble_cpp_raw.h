#ifndef LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW
#define LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW

#include <Rcpp.h>

//' Do it
//' @param fasta_filename FASTA filename
//' @return characters in each element of the vector
// [[Rcpp::export]]
Rcpp::List load_fasta_file_as_tibble_cpp_raw(
  const Rcpp::String& fasta_filename
);

#endif // LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW
