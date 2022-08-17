#ifndef CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL
#define CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL

#include <string>
#include <utility>
#include <vector>

// TRY TO DO SO ANYWAY Do not export, as Rcpp cannot handle the return type
//' Use Rcpp to calculate the distance to a TMH center
//' @param topology_str a topology as a string
//' @return a vector with distances
// [[Rcpp::export]]
std::vector<double>
  calc_distance_to_tmh_center_from_topology_str_cpp_stl(const std::string& topology_str)
;

#endif // CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL
