# Read RsMergeArch.bcp.gz
# snp_merge_file <- system.file("data-raw/", "RsMergeArch.bcp.gz",
#                               package = "MergedSNPs.Hsapiens.b149.GRCh38p7", mustWork = TRUE)

# Columns old snp (first column), updated snp (seventh column)
merged_snps <- readr::read_tsv("data-raw/RsMergeArch.bcp.gz",
                               col_names = c("old_snp", "upd_snp"),
                               col_types = "i-----i--")

#merged_snps_hash <- hash::hash(merged_snps$old_snp, merged_snps$upd_snp)
#save(merged_snps, file = "inst/extdata/merged_snps.rda", compress = FALSE)

usethis::use_data(merged_snps, internal = TRUE, overwrite = TRUE, version = 2)
