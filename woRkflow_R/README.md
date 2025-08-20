# How to Set Workflow in GitHub

## Reproducible Workflow
- RStudio Project + {here} paths
- Data: `data/raw` → `data/processed`
- Scripts in `code/` run in numeric order
- Outputs saved to `outputs/`

## How to run
1. Open the .Rproj
2. Run `code/00_packages_globals.R`
3. Run `code/10_data_preparation.R` → …
4. Knit `report.qmd`
