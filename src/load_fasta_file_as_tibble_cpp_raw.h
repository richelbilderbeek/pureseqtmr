#ifndef LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW
#define LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW

#include <Rcpp.h>

//' Use Rcpp to load a FASTA file
//' @param fasta_filename FASTA filename
//' @return a list with two character vectors,
//'   named 'name' and 'sequence'
// [[Rcpp::export]]
Rcpp::List load_fasta_file_as_tibble_cpp_raw(
  const Rcpp::String& fasta_filename
);

#endif // LOAD_FASTA_FILE_AS_TIBBLE_CPP_RAW
