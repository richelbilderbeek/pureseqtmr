# High warning level
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror

# Files
SOURCES += main.cpp \
  ../src/calc_distance_to_tmh_center_from_topology_str_cpp_stl.cpp \
  ../src/load_fasta_file_as_tibble_cpp_stl.cpp

HEADERS += \
  ../src/calc_distance_to_tmh_center_from_topology_str_cpp_stl.h \
  ../src/load_fasta_file_as_tibble_cpp_stl.h

INCLUDEPATH += ../src
