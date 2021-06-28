#' Replace NAs with SNP ids
#'
#' Replace \code{NA} in \code{new_snps} with SNP ids from \code{old_snps}.
#' Replacement is done position-wise.
#'
#' @return A vector of SNP ids.
#' @export
replace_na_with_snps <- function(old_snps, new_snps) {
  snps <- new_snps
  na <- is.na(new_snps)
  snps[na] <- old_snps[na]
  snps
}

#' Translation table of merged SNPs
#'
#' Returns the translation table of merged SNPs for \emph{Homo sapiens}, from
#' NCBI's dbSNP, build 149, Genome Reference Consortium 38, patch 7. This
#' function uses information provided in columns 1 and 7, i.e., rsHigh and
#' rsCurrent, respectively, in the file \href{ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606_b149_GRCh38p7/database/organism_data/RsMergeArch.bcp.gz}{RsMergeArch.bcp.gz}. For more information check
#' \href{https://www.ncbi.nlm.nih.gov/SNP/snp_db_table_description.cgi?t=RsMergeArch}{dbSNP Column Description for table: RsMergeArch}.
#'
#' @return A data frame. First column is rsHigh (\code{old_snp}) and rsCurrent
#' (\code{upd_snp}).
#' @export
snp_translation_table <- function() merged_snps

#' Converts a SNP id to its current SNP id.
#'
#' refSNP(rs) evolve in time and may be merged to earlier reference ids. This function allows to resolve a SNP id to its current id. This function uses information provided in columns 1 and 7, i.e., rsHigh and rsCurrent, respectively, in file RsMergeArch.bcp.gz for \emph{Homo sapiens}, from NCBI's dbSNP, build 149, Genome Reference Consortium 38, patch 7. Source data was originally downloaded from dbSNP ftp: \href{ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606_b149_GRCh38p7/database/organism_data/RsMergeArch.bcp.gz}{RsMergeArch.bcp.gz}.
#' @param snps A numeric vector of SNP reference ids (without the 'rs').
#' @param mapping If FALSE (default), return a vector of current ids; if TRUE, return a data frame with two columns,
#' @param keep.orig.snp.if.not.merged If \code{TRUE} (default), the returned vector of current SNP ids will contain original SNP ids for those SNPs that were not found in the translation table, otherwise, \code{NA}s will be returned instead.
#' @return Either a vector of current SNP ids or a data frame of original SNPs and current SNPs.
#' @export
current_snp <- function (snps, mapping = FALSE, keep.orig.snp.if.not.merged = TRUE) {
  if(!is.numeric(snps))
    stop("snps must be a numeric vector.")

  if(length(snps) < 1)
    stop("snps vector length is less than 1.")


  if(mapping) {
    return (merged_snps[match(snps, merged_snps$old_snp),])
  }
  else {
    if(keep.orig.snp.if.not.merged) {
      return(replace_na_with_snps(snps, merged_snps$upd_snp[match(snps, merged_snps$old_snp)]))
    } else {
      return (merged_snps$upd_snp[match(snps, merged_snps$old_snp)])
    }
  }

}
