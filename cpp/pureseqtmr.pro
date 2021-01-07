# High warning level
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror

# Files
SOURCES += main.cpp \
  ../src/load_fasta_file_as_tibble_cpp_stl.cpp

HEADERS += \
  ../src/load_fasta_file_as_tibble_cpp_stl.h

INCLUDEPATH += ../src
