#include "load_fasta_file_as_tibble_cpp_stl.h"

#include <cassert>
#include <fstream>

void test()
{
  // SARS-CoV-2
  {
    const std::string fasta_filename{"../inst/extdata/UP000464024.fasta"};
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
    assert(p.first.size() == 14);
    assert(p.second.size() == 14);
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
  // Allow empty sequences
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
  // FASTA file with empty sequences
  {
    const std::string fasta_filename{"../inst/extdata/100507436.topo"};
    const auto p = load_fasta_file_as_tibble_cpp_stl(fasta_filename);
  }
}

int main()
{
  test();
}
