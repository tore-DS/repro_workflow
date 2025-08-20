# CLEAN DATA

# Load Packages
library(haven)
library(dplyr)

# Import Data and Clean
autonomy_influence <- read_dta("data/autonomy_influence.dta")

#Change variables
autonomy_influence <- autonomy_influence %>%
  rename(
    country            = cname,   # new = old
    country_code       = ccode,
    avg_firm_influence = firm_score_est,
    campaign_fund_disc = v2eldonate,
    gdp_pc             = e_gdppc
  )


#Create new labels
attr(autonomy_influence$impar1, "label") <- 
  "Political Interference (reverse coded)"
attr(autonomy_influence$impar2, "label") <- 
  "Impartiality"
attr(autonomy_influence$avg_firm_influence, "label") <- NULL
