# Structural
suppressPackageStartupMessages({
    library(Seurat)
    library(ShinyCell)
})

## endothelium
seu =  get(load(file = "data/endothelium_glial_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf1 = createConfig(seu)
makeShinyFiles(seu, scConf1,gene.mapping = TRUE,shiny.prefix = "sc1",shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_structural/",gex.assay = "RNA")

## epithelium_ileal
seu =  get(load(file = "data/epi_ileal_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf2 = createConfig(seu)
makeShinyFiles(seu, scConf2, gene.mapping = TRUE, shiny.prefix = "sc2", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_structural/", gex.assay = "RNA")

## epithelium_colonic
seu =  get(load(file = "data/epithelium_colonic_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf3 = createConfig(seu)
makeShinyFiles(seu, scConf3, gene.mapping = TRUE, shiny.prefix = "sc3", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_structural/", gex.assay = "RNA")

## fibroblast_pericyte
seu =  get(load(file = "data/fib_peri_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf4 = createConfig(seu)
makeShinyFiles(seu, scConf4, gene.mapping = TRUE, shiny.prefix = "sc4", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_structural/", gex.assay = "RNA")

## Make files
makeShinyCodesMulti( shiny.title = "IBD Tissue Biopsies scRNAseq (13965420), Structural Cells", shiny.footnotes = NULL, shiny.prefix = c("sc1", "sc2", "sc3", "sc4"), shiny.headers = c("Endothelium", "Epithelium (Ileal)", "Epithelium (Colonic)", "fibroblast and Pericyte"),  shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_structural/") 