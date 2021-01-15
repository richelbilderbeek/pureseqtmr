# `pureseqtmr`

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/pureseqtmr)](https://cran.r-project.org/package=pureseqtmr)
[![](http://cranlogs.r-pkg.org/badges/grand-total/pureseqtmr)]( https://CRAN.R-project.org/package=pureseqtmr)
[![](http://cranlogs.r-pkg.org/badges/pureseqtmr)](https://CRAN.R-project.org/package=pureseqtmr)

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/pureseqtmr/actions)|[![Travis CI logo](man/figures/TravisCI.png)](https://travis-ci.org)                                                                      |[![Travis CI logo](man/figures/AppVeyor.png)](https://appveyor.com)                                                                                                                |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|---------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/pureseqtmr/workflows/R-CMD-check/badge.svg?branch=master)   |[![Build Status](https://travis-ci.org/richelbilderbeek/pureseqtmr.svg?branch=master)](https://travis-ci.org/richelbilderbeek/pureseqtmr) |[![Build status](https://ci.appveyor.com/api/projects/status/33mty2r5hlryv54k/branch/master?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/pureseqtmr/branch/master)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/pureseqtmr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/pureseqtmr/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/pureseqtmr/workflows/R-CMD-check/badge.svg?branch=develop)  |[![Build Status](https://travis-ci.org/richelbilderbeek/pureseqtmr.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/pureseqtmr)|[![Build status](https://ci.appveyor.com/api/projects/status/33mty2r5hlryv54k/branch/develop?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/pureseqtmr/branch/develop)|[![codecov.io](https://codecov.io/github/richelbilderbeek/pureseqtmr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/pureseqtmr/branch/develop)

R package to work with PureseqTM.

Because PureseqTM only works on Linux, `pureseqtmr` only works on Linux.

## Example

```r
library(pureseqtmr)

# Use an example proteome
fasta_filename <- system.file(
  "extdata", 
  "UP000464024.fasta", 
  package = "pureseqtmr"
)

# Predict the topology
topology <- predict_topology(fasta_filename)

# Simplify the protein names
topology$name <- stringr::str_match(
  string = topology$name,
  pattern = "..\\|.*\\|(.*)_SARS2"
)[,2]

# Plot the topology
plot_topology(topology)
```

![SARS-CoV-2 topology](man/figures/sars_cov_2_topology.png)


## Install

Install the package:

```
remotes::install_github("richelbilderbeek/pureseqtmr")
```

Install PureseqTM to a default folder:

```
pureseqtmr::install_pureseqtm()
```

## How to convert a FASTA file to a PureseqTM topolgy file?

Combine `predict_topology` and `save_tibble_as_fasta_file`:

```
library(pureseqtmr)

save_tibble_as_fasta_file(
  predict_topology(fasta_filename = "my.fasta"),
  fasta_filename = "my.topo"
)
```

### Are there similar packages?

These are the ones I use:

 * [tmhmm](https://github.com/richelbilderbeek/tmhmm): 
   predict membrane protein topology at three levels (inside, outside, membrane),  
   do need registration form, as it is for academic users only

Note that running script shows that TMHMM is approximately 100x faster than PureseqTM:

```
fasta_filename <- system.file("extdata", "UP000464024.fasta", package = "pureseqtmr")
system.time({tmhmm::predict_topology(fasta_filename = fasta_filename)})
system.time({pureseqtmr::predict_topology(fasta_filename = fasta_filename)})
```

Results:

```
> system.time({tmhmm::predict_topology(fasta_filename = fasta_filename)})
   user  system elapsed 
  1.723   0.008   1.733 
> system.time({pureseqtmr::predict_topology(fasta_filename = fasta_filename)})
   user  system elapsed 
117.511   1.746  85.748 
```

Also when running these tools from scripts, the results are similar:

```
time ./bin/decodeanhmm.Linux_x86_64 lib/TMHMM2.0.model UP000464024.fasta -f lib/TMHMM2.0.options
[...]
real	0m1.379s
user	0m1.375s
sys	0m0.004s
```

```
time ./PureseqTM_proteome.sh -i UP000464024.fasta 
71
real	0m53.471s
user	1m36.354s
sys	0m1.426s
```

## There is a feature I miss

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting use cases`

## I want to collaborate

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting code'

## I think I have found a bug

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting bugs' 

## There's something else I want to say

Sure, just add an Issue. Or send an email.

## External links

 * [PureseqTM GitHub repo](https://github.com/PureseqTM/pureseqTM_package)
 * [PureseqTM server](http://pureseqtm.predmp.com/)

## References

Article about `PureseqTM`:

 * Wang, Qing, et al. "Efficient and accurate prediction of transmembrane topology from amino acid sequence only." bioRxiv (2019): 627307.

