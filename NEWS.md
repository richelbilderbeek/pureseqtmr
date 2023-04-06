# News

Newest versions at top.

## pureseqtmr 1.4 (2023-04-06)

### NEW FEATURES

  * None

### MINOR IMPROVEMENTS

  * None

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

## pureseqtmr 1.3 (unreleased)

### NEW FEATURES

  * Add `predict_topologies_from_sequences` to predict topologies 
    directly from one or more sequences
  * `predict_topology` works on empty FASTA files
  * `predict_topology` returns topologies in the same order as the sequences,
    a workaround for https://github.com/PureseqTM/PureseqTM_Package/issues/11
  * `create_pureseqtm_proteome_file` shows PureseqTM error messages
  * Add `mock_predict_topologies` and `mock_predict_topologies_from_sequences`
    to mock the prediction of topologies,
    as can be useful in testing
  * Add `count_n_tmhs` to count the number of TMHs
  * `load_fasta_file_as_tibble_cpp` (which uses C++) 
    is approximately ten thousand
    times as fast as `load_fasta_file_as_tibble_r` (which uses R)
  * `load_fasta_file_as_tibble` runs C++ and R version
    and checks if the results are equal. Will be removed later
  * Give error on selenoproteins, garbage sequences and very short
    proteins
  * Add `is_valid_protein_sequence` and `are_valid_protein_sequences`

### MINOR IMPROVEMENTS

  * None

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

## pureseqtmr 1.2 (2020-07-31)

### NEW FEATURES

  * First version on CRAN

### MINOR IMPROVEMENTS

  * Process feedback CRAN, thanks Swetlana Herbrandt

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

## pureseqtmr 1.1 (2020-06-18)

### NEW FEATURES

  * None

### MINOR IMPROVEMENTS

  * Process feedback CRAN, thanks Jelena Saf

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

## pureseqtmr 1.0 (2020-05-21)

### NEW FEATURES

  * Initial version

### MINOR IMPROVEMENTS

  * None

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

