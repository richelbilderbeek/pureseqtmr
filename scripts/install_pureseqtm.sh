#!/bin/bash
#
# Installs PureseqTM using the R code in the 'pureseqtmr' package
#
# Because the R code in the package uses 'pureseqtmr::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_pureseqtm.sh
#
#
cat R/install_pureseqtm.R > tempscript.R
cat R/get_default_pureseqtm_folder.R >> tempscript.R
cat R/get_pureseqtm_url.R >> tempscript.R
cat R/is_pureseqtm_installed.R >> tempscript.R

echo "install_pureseqtm()" >> tempscript.R
sed -i'.orginal' "s/pureseqtmr:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
