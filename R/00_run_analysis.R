
library(Seurat)
library(celldex)
library(SingleR)
library(anndataR)

run_analysis <- function(file_path, col_to_keep, annotation = c("monaco", "blueprint"), output_file = "output.rda") {
  # Load the .h5ad file and convert to Seurat object
  adata <- anndataR::read_h5ad(file_path)
  object <- adata$to_Seurat()
  
  # Normalize data
  object <- NormalizeData(object)
  
  # Increase globals size for future
  options(future.globals.maxSize = 6000 * 1024^3)
  
  # Perform SCTransform
  object <- SCTransform(object, ncells = 3000, variable.features.n = 2000, 
                        vst.flavor = "v2", method = 'glmGamPoi', 
                        conserve.memory = FALSE, verbose = TRUE)
  
  # Run PCA
  object <- RunPCA(object, npcs = 30, verbose = TRUE)
  
  # Run UMAP
  object <- RunUMAP(object, reduction = "pca", dims = 1:20)
  
  # Find neighbors and clusters
  object <- FindNeighbors(object, reduction = "pca", dims = 1:20)
  object <- FindClusters(object, resolution = 0.5)
  
  # Load references for annotation
  monaco.ref <- celldex::MonacoImmuneData()
  blueprint.ref <- celldex::BlueprintEncodeData()
  
  # Annotation
  seu <- LayerData(object)
  
  if ("blueprint" %in% annotation) {
    blueprint.main <- SingleR(test = seu, assay.type.test = 1, 
                               ref = blueprint.ref, labels = blueprint.ref$label.main)
    object@meta.data$blueprint.main <- blueprint.main$pruned.labels
  }
  
  if ("monaco" %in% annotation) {
    monaco.fine <- SingleR(test = seu, assay.type.test = 1, 
                           ref = monaco.ref, labels = monaco.ref$label.fine)
    object@meta.data$monaco.fine <- monaco.fine$pruned.labels
  }

  # Clean up metadata
  object@meta.data$General_CellType <- object@meta.data$sub_bucket
  object@meta.data$Specific_CellType <- object@meta.data$final_analysis
  object@meta.data$Disease_Treatment <- paste(object@meta.data$Disease, 
                                                object@meta.data$Treatment, sep = '_')
  # Fix naming
  seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
  # Reorder `Disease_Treatment`
  newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
  seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)
  
  # Subset metadata to keep specified columns
  object@meta.data <- object@meta.data[, col_to_keep, drop = FALSE]

  # Save the updated object as an .rda file
  save(object, file = output_file)
  
  return(object)
}

# # Example usage
# # Specify your .h5ad file path and output file path
# input_file_path = 'data/bcell_viz_ready_revised.h5ad'
# output_file_path = "path/to/your/directory/your_output_file.rda"

# col_to_keep = c('orig.ident', 'nCount_RNA', 'nFeature_RNA', 'Disease', 'Patient', 'Site', 'Treatment', 'Inflammation', 'Remission', 'General_CellType', 'Specific_CellType', 'monaco.fine')

# obj <- run_analysis(file_path = input_file_path, col_to_keep = col_to_keep,  annotation = c("monaco", "blueprint"),  output_file = output_file_path)
