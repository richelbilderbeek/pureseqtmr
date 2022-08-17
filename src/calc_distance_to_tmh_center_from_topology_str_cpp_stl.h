#ifndef CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL
#define CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL

#include <string>
#include <utility>
#include <vector>

// Do not export, this a C++ helper function
bool are_all_nan(const std::vector<double>& values);

//' Use Rcpp to calculate the distance to a TMH center
//' @param topology_str a topology as a string
//' @return a vector with distances
// [[Rcpp::export]]
std::vector<double>
  calc_distance_to_tmh_center_from_topology_str_cpp_stl(const std::string& topology_str)
;

// Collect the TMH center indices
//
// For example:
//
// topology_str 0001110000
// index        0123456789
// center           *
// returned         4
//
// topology_str 0011110000
// index        0123456789
// center          **
// returned        3.5 (i.e. 'three and a half')
//
// Do not export, this a C++ helper function
std::vector<double> collect_tmh_center_indices(const std::string& topology_str);

// Collect the TMH start indices, whch is the first TMH AA
//
// For example:
//
// topology_str 0001110000
// index        0123456789
// returned        3
//
// Do not export, this a C++ helper function
std::vector<int> collect_tmh_start_indices(const std::string& topology_str);

// Collect the TMH stop indices, which is beyond the last TMH AA
//
// For example:
//
// topology_str 0001110000
// index        0123456789
// returned           6
//
// Do not export, this a C++ helper function
std::vector<int> collect_tmh_stop_indices(const std::string& topology_str);

// Pad the center indices, by adding the lowest possible double at the front
// and the highest possible double at the end.
// Do not export, this a C++ helper function
std::vector<double> pad_center_indices(const std::vector<double>& center_indices);

#endif // CALC_DISTANCE_TO_TMH_CENTER_FROM_TOPOLOGY_STR_CPP_STL
