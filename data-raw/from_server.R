library(ThodbergMisc)
collections("Genomics")
library(tidyverse)

#### Design ####

# Project folder
project_dir <- file.path(run_loc(), "isdata", "sandelin", "people", "nzl922", "CAGEbase", "mm9_nanotubes")

# Read design
design_fname <- file.path(project_dir, "design.tab")
design <- read.table(design_fname, header=TRUE)

# Format
design <- design %>%
    mutate(Class=fct_recode(Class, Ctrl="control", Nano="nano"))
rownames(design) <- design$Name

#### Copy files ####

move_bigwig <- function(f, s){
    # Import
    iname <- file.path(project_dir, f)
    b <- import(iname)

    # Flank
    strand(b) <- s
    b <- shift(b, 1)

    # Export
    oname <- file.path("inst/extdata/", f)
    export(b, con = oname)
}

walk(design$BigWigPlus, move_bigwig, s="+")
walk(design$BigWigMinus, move_bigwig, s="-")

#### Write data ####

nanotubes <- design
usethis::use_data(nanotubes)
