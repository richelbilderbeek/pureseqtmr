#include "calc_distance_to_tmh_center_from_topology_str_cpp_stl.h"

#include <algorithm>
#include <cassert>
#include <fstream>
#include <stdexcept>
#include <cmath>

bool are_all_nan(const std::vector<double>& values)
{
  const int n_values{static_cast<int>(values.size())};
  return n_values == std::count_if(
    std::begin(values),
    std::end(values),
    [](const double x) { return std::isnan(x); }
  );
}

std::vector<double> calc_distance_to_tmh_center_from_topology_str_cpp_stl(
  const std::string& topology_str
)
{
  if (topology_str.empty()) return {};

  const std::vector<double> center_indices{collect_tmh_center_indices(topology_str)};
  if (center_indices.empty())
  {
    // Happens, e.g. with '00000'
    return std::vector<double>(topology_str.size(), std::nan(""));
  }
  std::vector<double> distances;
  distances.reserve(topology_str.size());

  const std::vector<double> padded_center_indices{
    pad_center_indices(center_indices)
  };
  const int n_char{static_cast<int>(topology_str.size())};
  int centers_index{0};
  for (int char_index{0}; char_index!=n_char; ++char_index)
  {
    const double position{static_cast<double>(char_index)};
    assert(centers_index < static_cast<int>(padded_center_indices.size()));
    if (padded_center_indices[centers_index] > position
      || padded_center_indices[centers_index + 1] < position)
    {
      // Keep prev_tmh_center_pos < centers_index < next_tmh_center_pos
      ++centers_index;
    }
    const double prev_tmh_center_pos{padded_center_indices[centers_index]};
    assert(position >= prev_tmh_center_pos);
    const double distance_back{
      position - prev_tmh_center_pos
    };
    assert(distance_back >= 0.0);
    assert(centers_index + 1 < static_cast<int>(padded_center_indices.size()));
    const double next_tmh_center_pos{padded_center_indices[centers_index + 1]};
    assert(prev_tmh_center_pos < next_tmh_center_pos);
    assert(position <= next_tmh_center_pos);
    const double distance_forward{
      position - next_tmh_center_pos
    };
    assert(distance_forward <= 0.0);
    if (std::abs(distance_back) < std::abs(distance_forward))
    {
      distances.push_back(distance_back);
    }
    else
    {
      distances.push_back(distance_forward);
    }
  }
  return distances;
}

std::vector<double> collect_tmh_center_indices(const std::string& topology_str)
{
  if (topology_str.empty()) return {};
  const std::vector<int> start_indices{collect_tmh_start_indices(topology_str)};
  const std::vector<int> stop_indices{collect_tmh_stop_indices(topology_str)};
  assert(start_indices.size() == stop_indices.size());
  std::vector<double> center_indices;
  center_indices.reserve(start_indices.size());
  const int n{static_cast<int>(start_indices.size())};
  for (int i{0}; i!=n; ++i)
  {
    const double index{(start_indices[i] + (stop_indices[i] - 1)) / 2.0};
    center_indices.push_back(index);
  }
  return center_indices;
}

std::vector<int> collect_tmh_start_indices(const std::string& topology_str)
{
  if (topology_str.empty()) return {};
  std::vector<int> start_indices;
  if (topology_str[0] == '1') start_indices.push_back(0);
  size_t from_pos{0};
  while (1)
  {
    const auto new_from_pos = topology_str.find("01", from_pos);
    if (new_from_pos == std::string::npos) break;
    const int index{static_cast<int>(new_from_pos) + 1};
    assert(index >= 0);
    assert(index < static_cast<int>(topology_str.size()));
    assert(topology_str[index] == '1');
    assert(topology_str[index - 1] == '0');
    start_indices.push_back(index);
    from_pos = new_from_pos + 1;
  }
  return start_indices;
}

std::vector<int> collect_tmh_stop_indices(const std::string& topology_str)
{
  if (topology_str.empty()) return {};
  std::vector<int> stop_indices;
  size_t from_pos{0};
  while (1)
  {
    const auto new_from_pos = topology_str.find("10", from_pos);
    if (new_from_pos == std::string::npos) break;
    const int index{static_cast<int>(new_from_pos) + 1};
    assert(index >= 0);
    assert(index < static_cast<int>(topology_str.size()));
    assert(topology_str[index] == '0');
    assert(topology_str[index - 1] == '1');
    stop_indices.push_back(index);
    from_pos = new_from_pos + 1;
  }
  if (topology_str.back() == '1') stop_indices.push_back(topology_str.size());
  return stop_indices;
}

std::vector<double> pad_center_indices(const std::vector<double>& center_indices)
{
  std::vector<double> padded_center_indices;
  padded_center_indices.reserve(center_indices.size() + 2);
  const double lowest_double{
    -std::numeric_limits<double>::max()
  };
  assert(lowest_double < 0.0);
  padded_center_indices.push_back(lowest_double);
  std::copy(
    std::begin(center_indices),
    std::end(center_indices),
    std::back_inserter(padded_center_indices)
  );
  padded_center_indices.push_back(std::numeric_limits<double>::max());
  return padded_center_indices;
}
