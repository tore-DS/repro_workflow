################################################################################
###To set up project folder structure
################################################################################

# Install helpers if required. Load them. 
require("fs")
require("here")


# Directories
dirs <- c(
  "data", "data/raw", "data/processed",
  "code", "figures", "presentations", "docs", "logs", "outputs"
)
fs::dir_create(dirs)

# Track empty dirs in git
lapply(dirs, function(d) file.create(file.path(d, ".gitkeep")))

# Code files (use ordered prefixes)
scripts <- c(
  "00_packages_globals",
  "10_data_preparation",
  "20_merging",
  "30_descriptives",
  "40_analysis",
  "50_visualization",
)
for (s in scripts) {
  f <- file.path("code", paste0(s, ".R"))
  if (!file.exists(f)) file.create(f)
}

# README & CODEBOOK
if (!file.exists("README.md")) {
  writeLines(c(
    "# Project Title",
    "",
    "## Reproducible Workflow",
    "- RStudio Project + {here} paths",
    "- Data: `data/raw` → `data/processed`",
    "- Scripts in `code/` run in numeric order",
    "- Outputs saved to `outputs/`",
    "",
    "## How to run",
    "1. Open the .Rproj",
    "2. Run `code/00_packages_globals.R`",
    "3. Run `code/10_data_preparation.R` → …",
    "4. Knit `report.qmd`"
  ), "README.md")
}
if (!file.exists("CODEBOOK.md")) {
  writeLines(c("# Codebook", "", "Document variables, sources, and transformations here."), "CODEBOOK.md")
}
  
  
################################################################################
###To retain packages when updating R
################################################################################
#1 
mypks <- rownames(installed.packages())
saveRDS(mypks, "mypks.rds")

#2 --- Update R in RGui: updateR(TRUE)

#3 
mypks <- readRDS("mypks.rds")
install.packages(mypks)
  
  