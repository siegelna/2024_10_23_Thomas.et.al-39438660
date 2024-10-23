# Immune Cells #
## Input file paths
file_list <- list(
    'data/bcell_viz_ready_revised.h5ad',
    'data/cd4tcell_viz_ready_revised.h5ad',
    'data/cd8tcell_viz_ready_revised.h5ad',
    'data/ilc_viz_ready_revised.h5ad',
    'data/myeloid_viz_ready_revised.h5ad',
    'data/plasmacell_viz_ready_revised.h5ad'
)
unlist_files <- unlist(file_list)

## Specify output columns
col_to_keep = c('orig.ident', 'nCount_RNA', 'nFeature_RNA', 'Disease', 'Patient',
 'Site', 'Treatment', 'Inflammation', 'Remission', 'General_CellType', 'Specific_CellType',
'monaco.fine')

## Run work flow
lapply(unlist_files, function(file) {
  output_file <- sub("\\.h5ad$", ".rda", file)
  cat("Processing immune cell file:", file, "\n")
  run_analysis(file_path = file, col_to_keep = col_to_keep,  
               annotation = c("monaco"),  
               output_file = output_file)
  cat("Finished processing:", output_file, "\n")
})

# Structural Cells #
## Input file paths
file_list <- list(
    'data/endothelium_glial_viz_ready_revised.h5ad',
    'data/epi_ileal_viz_ready_revised.h5ad',
    'data/epithelium_colonic_viz_ready_revised.h5ad',
    'data/fib_peri_viz_ready_revised.h5ad'
)
unlist_files <- unlist(file_list)

## Specify output columns
col_to_keep = c('orig.ident', 'nCount_RNA', 'nFeature_RNA', 'Disease', 'Patient',
 'Site', 'Treatment', 'Inflammation', 'Remission', 'General_CellType', 'Specific_CellType',
'blueprint.main')

## Run work flow
lapply(unlist_files, function(file) {
  output_file <- sub("\\.h5ad$", ".rda", file)
  cat("Processing structural cell file:", file, "\n")
  run_analysis(file_path = file, col_to_keep = col_to_keep,  
               annotation = c("blueprint"),  
               output_file = output_file)
  cat("Finished processing:", output_file, "\n")
})