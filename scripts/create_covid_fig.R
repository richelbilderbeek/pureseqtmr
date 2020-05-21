library(pureseqtmr)
library(testthat)

fasta_filename <- system.file(
  "extdata", 
  "UP000464024.fasta", 
  package = "pureseqtmr"
)
expect_true(file.exists(fasta_filename))

topology <- predict_topology(fasta_filename)

topology$name <- stringr::str_match(
  string = topology$name,
  pattern = "..\\|.*\\|(.*)_SARS2"
)[,2]

plot_topology(topology) + ggplot2::ggsave("../man/figures/covid_19_topology.png")

