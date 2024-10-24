# Immune
suppressPackageStartupMessages({
    library(Seurat)
    library(ShinyCell)
})

## bcell
seu =  get(load(file = "data/bcell_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf1 = createConfig(seu)
makeShinyFiles(seu, scConf1,gene.mapping = TRUE,shiny.prefix = "sc1",shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/",gex.assay = "RNA")

## cd4
seu =  get(load(file = "data/cd4tcell_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf2 = createConfig(seu)
makeShinyFiles(seu, scConf2, gene.mapping = TRUE, shiny.prefix = "sc2", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/", gex.assay = "RNA")

## cd8
seu =  get(load(file = "data/cd8tcell_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf3 = createConfig(seu)
makeShinyFiles(seu, scConf3, gene.mapping = TRUE, shiny.prefix = "sc3", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/", gex.assay = "RNA")


## ilc
seu =  get(load(file = "data/ilc_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf4 = createConfig(seu)
makeShinyFiles(seu, scConf4, gene.mapping = TRUE, shiny.prefix = "sc4", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/", gex.assay = "RNA")

## myeloid
seu =  get(load(file = "data/myeloid_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf5 = createConfig(seu)
makeShinyFiles(seu, scConf5, gene.mapping = TRUE, shiny.prefix = "sc5", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/", gex.assay = "RNA")

## plasma
seu =  get(load(file = "data/plasmacell_viz_ready_revised.rda"))

# temp
seu@meta.data$Disease_Treatment <- paste(seu@meta.data$Disease, seu@meta.data$Treatment, sep = '_')
seu@meta.data$Disease_Treatment <- gsub("Healthy_None", "Healthy", seu@meta.data$Disease_Treatment)
newlevels <- c('Healthy', 'UC_Pre', 'UC_Post', 'CD_Pre', 'CD_Post')
seu@meta.data$Disease_Treatment <- factor(seu@meta.data$Disease_Treatment, levels = newlevels)

scConf6 = createConfig(seu)
makeShinyFiles(seu, scConf6, gene.mapping = TRUE, shiny.prefix = "sc6", shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/", gex.assay = "RNA")

## Make files
makeShinyCodesMulti( shiny.title = "IBD Tissue Biopsies scRNAseq (13965420), Immune Cells", shiny.footnotes = NULL, shiny.prefix = c("sc1", "sc2", "sc3", "sc4", "sc5", "sc6"), shiny.headers = c("B cell", "CD4 T cell", "CD8 T cell", "ILC", "Myeloid", "Plasma cell"),  shiny.dir = "IBD_biopsy_scRNAseqzenodoID13965420_immune/") 