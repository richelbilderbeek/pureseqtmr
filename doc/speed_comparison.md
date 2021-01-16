# `pureseqtmr` speed comparison

## `pureseqtmr` versus `tmhmm`

[tmhmm](https://github.com/richelbilderbeek/tmhmm) predict 
membrane protein topology at three levels (inside, outside, membrane),  
one does need to fill in a registration form, as it is for academic users only.

This scripts demonstrates that PureseqTM is approximately 100x slower than TMHMM:

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

