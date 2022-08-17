#include "load_fasta_file_as_tibble_cpp_stl.h"
#include "calc_distance_to_tmh_center_from_topology_str_cpp_stl.h"

#include <cassert>
#include <cmath>
#include <fstream>
#include <iostream>
#include <string>

void test_calc_distance_to_tmh_center_from_topology_str_cpp_stl()
{
  // empty input, empty output
  {
    const std::string s{""};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(s.size() == v.size());
  }
  // same amount of elements in the output as characters in the input
  {
    const std::string s{"1"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(s.size() == v.size());
  }
  // no TMHs means only NANs, 1 AA
  {
    const std::string s{"0"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(are_all_nan(v));
  }
  // no TMHs means only NANs, 2 AA
  {
    const std::string s{"00"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(are_all_nan(v));
  }
  // simple distances, 2 AA
  {
    const std::string s{"01"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -1.0);
    assert(v[1] == 0.0);
  }
  // simple distances, 2 AA
  {
    const std::string s{"10"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == 0.0);
    assert(v[1] == 1.0);
  }
  // simple distances, 3 AA
  {
    const std::string s{"010"};
    const std::vector<int> start_indices{collect_tmh_start_indices(s)};
    const std::vector<int> stop_indices{collect_tmh_stop_indices(s)};
    assert(start_indices.size() == 1);
    assert(start_indices[0] == 1);
    assert(stop_indices.size() == 1);
    assert(stop_indices[0] == 2);
    const std::vector<double> center_indices{collect_tmh_center_indices(s)};
    assert(center_indices.size() == 1);
    assert(center_indices[0] == 1.0);
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -1.0);
    assert(v[1] == 0.0);
    assert(v[2] == 1.0);
  }
  // simple distances, 3 AA
  {
    const std::string s{"001"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -2.0);
    assert(v[1] == -1.0);
    assert(v[2] == 0.0);
  }
  // simple distances, 3 AA
  {
    const std::string s{"100"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == 0.0);
    assert(v[1] == 1.0);
    assert(v[2] == 2.0);
  }
  // simple distances, 4 AA
  {
    const std::string s{"0110"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -1.5);
    assert(v[1] == -0.5);
    assert(v[2] == 0.5);
    assert(v[3] == 1.5);
  }
  // simple distances, 4 AA
  {
    const std::string s{"0011"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -2.5);
    assert(v[1] == -1.5);
    assert(v[2] == -0.5);
    assert(v[3] ==  0.5);
  }
  // simple distances, 4 AA
  {
    const std::string s{"1100"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -0.5);
    assert(v[1] ==  0.5);
    assert(v[2] ==  1.5);
    assert(v[3] ==  2.5);
  }
  // simple distances, 5 AAs
  {
    const std::string s{"01110"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(v[0] == -2.0);
    assert(v[1] == -1.0);
    assert(v[2] == 0.0);
    assert(v[3] == 1.0);
    assert(v[4] == 2.0);
  }
  // one TMH
  {
    const std::string s{"0000000000001110000000000000000000"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
  }
  // two TMH
  {
    const std::string s{"01010"};
    const auto v{
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(s)
    };
    assert(!are_all_nan(v));
    assert(v[0] == -1.0);
    assert(v[1] == -0.0);
    assert(v[2] == -1.0); // We assume this rarely happens in reality
    assert(v[3] == 0.0);
    assert(v[4] == 1.0);
  }
}

void test_load_fasta_file_as_tibble_cpp_stl()
{
  // SARS-CoV-2
  {
    const std::string fasta_filename{"../inst/extdata/UP000464024.fasta"};
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first.size() == 14);
    assert(p.second.size() == 14);
  }
  {
    const std::string fasta_filename{
      "/home/richel/.local/share/PureseqTM_Package/example/test_proteome.fasta"
    };
    if (file_exists(fasta_filename)) {
      const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
      assert(p.first.size() == 3);
      assert(p.second.size() == 3);
    }
  }
  // detailed use
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
  }
  // A FASTA file can start with a newline
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << '\n'
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
  }
  // A FASTA file can start with an empty newline
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << "" << '\n'
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
  }
  // empty file
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os << "";
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first.empty());
    assert(p.second.empty());
  }
  // Allow empty last sequence
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "");
  }
  // Allow non-empty last sequence with empty line
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
  }
  // Allow non-empty last sequence with multiplr empty lines
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << "" << '\n'
      << ">1" << '\n'
      << "" << '\n'
      << "A" << '\n'
      << "" << '\n'
      << "" << '\n'
      << ">2" << '\n'
      << "" << '\n'
      << "" << '\n'
      << "CG" << '\n'
      << "" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
  }
  // Allow empty sequences in the middle
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "" << '\n'
      << ">3" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.first[2] == "3");
    assert(p.second[0] == "A");
    assert(p.second[1] == "");
    assert(p.second[2] == "CG");
  }
  // Allow non-empty sequences in the middle with an empty line
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << "A" << '\n'
      << ">2" << '\n'
      << "" << '\n'
      << "CG" << '\n'
      << ">3" << '\n'
      << "T" << '\n'
    ;
    os.close();
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first[0] == "1");
    assert(p.first[1] == "2");
    assert(p.first[2] == "3");
    assert(p.second[0] == "A");
    assert(p.second[1] == "CG");
    assert(p.second[2] == "T");
  }
  // FASTA file with empty sequences
  {
    const std::string fasta_filename{"../inst/extdata/100507436.topo"};
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
  }
  // Error when two names
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << ">1" << '\n'
      << ">2" << '\n'
      << "CG" << '\n'
    ;
    os.close();
    bool has_had_error = false;
    try
    {
      load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    }
    catch (const std::exception& e)
    {
      has_had_error = true;
      assert(std::string(e.what()) == "Invalid FASTA file: second consecutive line starting with '>' in line 2");
    }
    assert(has_had_error);
  }
  // Error when starting with sequence
  {
    const std::string fasta_filename = "tmp.fasta";
    std::ofstream os(fasta_filename);
    os
      << "CG" << '\n'
    ;
    os.close();
    bool has_had_error = false;
    try
    {
      load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    }
    catch (const std::exception& e)
    {
      has_had_error = true;
      assert(std::string(e.what()) == "Invalid FASTA file: expected a line starting with '>' in line 1");
    }
    assert(has_had_error);
  }
}

void create_random_fasta_file(
  const std::string fasta_filename = "tmp.fasta"
)
{
  std::ofstream os(fasta_filename);
  const int n_lines = std::rand() % 10;
  for (int i = 0; i != n_lines; ++i)
  {
    switch (std::rand() % 11)
    {
      case 0: os << '\n'; break;
      case 1: os << "" << '\n'; break;
      case 2: os << " " << '\n'; break;
      case 3: os << ">" << '\n'; break;
      case 4: os << "> " << '\n'; break;
      case 5: os << "> X" << '\n'; break;
      case 6: os << " > X" << '\n'; break;
      case 7: os << "A" << '\n'; break;
      case 8: os << "AC" << '\n'; break;
      case 9: os << "ACG" << '\n'; break;
      default: os << " ACG" << '\n'; break;
    }
  }
  os.close();
}

int main()
{
  test_calc_distance_to_tmh_center_from_topology_str_cpp_stl();
  test_load_fasta_file_as_tibble_cpp_stl();

  // Try random combinations
  {
    const std::string fasta_filename = "tmp.fasta";
    for (int i = 0; i!=100000; ++i)
    {
      std::cout << i << '\n';
      create_random_fasta_file(fasta_filename);
      try
      {
        load_fasta_file_as_tibble_cpp_stl(fasta_filename);
      }
      catch (const std::exception& e)
      {
        // No worries
      }
    }
  }
}
