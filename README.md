
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MergedSNPs.Hsapiens.dbSNP149.GRCh38p7

<!-- badges: start -->
<!-- badges: end -->

The goal of MergedSNPs.Hsapiens.dbSNP149.GRCh38p7 is to allow an easy
translation map old SNP identifiers to its current SNP id. Note that
*current* means current as of version 149 of dbSNP (which is rather old
nowadays).

This data set is based on the columns `rsHigh` (old SNP identifier) and
`rsCurrent` (new SNP identifier) from the file
[RsMergeArch.bcp.gz](ftp://ftp.ncbi.nlm.nih.gov/snp/organisms/human_9606/database/organism_data/RsMergeArch.bcp.gz).
Note that the link to this file is no longer of the version provided by
this package. To inspect the version 149 of `RsMergeArch.bcp.gz` browse
into `/data-raw/RsMergeArch.bcp.gz`.

## Installation

Because I use [Git LFS](https://git-lfs.github.com/) to track some of
the files in this R package, you will need to have [Git
LFS](https://git-lfs.github.com/) installed before installing this
package. You can check if you have Git LFS already installed by running:

``` bash
git lfs version
```

It should return Git LFS’s version if installed, or a Git error:
`git: 'lfs' is not a git command. See 'git --help'.`

If you don’t have it installed already, and if you are on Ubuntu, you
can install it with:

``` bash
sudo apt-get update -y
sudo apt-get install -y git-lfs
```

Then, because of issues
[\#192](https://github.com/r-lib/remotes/issues/292),
[\#91584](https://community.rstudio.com/t/cant-access-data-in-a-package-that-i-created/91584),
[\#889](https://github.com/r-lib/devtools/issues/889), you need to clone
this repository first and then install from the local folder generated
on your computer:

``` bash
# This will clone the repository to your home folder.
cd ~
git clone https://github.com/maialab/MergedSNPs.Hsapiens.dbSNP149.GRCh38p7
```

And finally install MergedSNPs.Hsapiens.dbSNP149.GRCh38p7 from the local
folder (assuming it’s in your home folder):

``` r
# install.packages("remotes")
remotes::install_local("~/MergedSNPs.Hsapiens.dbSNP149.GRCh38p7")
```

If the installation went successful, you may remove the local folder
`~/MergedSNPs.Hsapiens.dbSNP149.GRCh38p7` (or other path if you cloned
to another folder):

``` bash
rm -rf ~/MergedSNPs.Hsapiens.dbSNP149.GRCh38p7
```

## Usage

Please note that the SNP identifiers should be integer numbers, and
hence without the `"rs"` prefix.

``` r
library(MergedSNPs.Hsapiens.dbSNP149.GRCh38p7)

snps <- as.numeric(253020:253050)
current_snp(snps)
#>  [1] 252966 252967 252968 252969 252970 252971 252972 252973 252974 252975
#> [11] 252976 252977 252978 252979 252980 252981 252982 253037 252959 252960
#> [21] 252961 253041 252963 252964 252965 253045 253046 250716 250718 250719
#> [31] 250721
```

If you rather have those SNPs that are not found in the translation
table returned as `NA`, then do this instead:

``` r
current_snp(snps, keep.orig.snp.if.not.merged = FALSE)
#>  [1] 252966 252967 252968 252969 252970 252971 252972 252973 252974 252975
#> [11] 252976 252977 252978 252979 252980 252981 252982     NA 252959 252960
#> [21] 252961     NA 252963 252964 252965     NA     NA 250716 250718 250719
#> [31] 250721
```
