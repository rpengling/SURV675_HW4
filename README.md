# SURV675_HW4
## Repository for SURV675's Homework 4 assignemnt -- creating an interactive Shiny app. 

Welcome! This project is designed to let app users explore data from the World Value Study's 2006 Wave. Specifically, we were asked to accomplish the following: 

  + a. Overview: what is the aim of the app and how to navigate it 
  + b. Exploring attitudes to democracy  
  + c. Exploring news consumption 
  + d. Exploring attitudes to science 
  
Sections b, c and d all have three things inside:
  + plot the averages (proportions by category for news) of the questions in that section for the country
    selected (i.e., if they select Algeria shows the graph just for Algeria)
  + a table with the averages (proportions by category for news) of the questions in that section for the
    country selected
  + a similar table as above but with the information on the entire WVS sample 
  
  
## Click [here](https://tdvnp2-rachel-engling.shinyapps.io/app_scripts/) to open the app. 



Data for this project was retrieved from the [World Value Survey](https://www.worldvaluesurvey.org/WVSDocumentationWV6.jsp), cited below. 

Inglehart, R., C. Haerpfer, A. Moreno, C. Welzel, K. Kizilova, J. Diez-Medrano, M. Lagos, P. Norris, E. Ponarin & B. Puranen et al. (eds.). 2018. World Values Survey: Round Six - Country-Pooled Datafile. Madrid, Spain & Vienna, Austria: JD Systems Institute & WVSA Secretariat. doi.org/10.14281/18241.8


## Session Information for Reproducibility 

R version 4.4.1 (2024-06-14 ucrt)
Platform: x86_64-w64-mingw32/x64
Running under: Windows 11 x64 (build 26100)

Matrix products: default


locale:
[1] C
system code page: 65001

time zone: America/New_York
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] here_1.0.1           DT_0.33              plotly_4.10.4        vroom_1.6.5          lubridate_1.9.3      forcats_1.0.0        stringr_1.5.1       
 [8] dplyr_1.1.4          purrr_1.0.2          readr_2.1.5          tidyr_1.3.1          tibble_3.2.1         ggplot2_3.5.1        tidyverse_2.0.0     
[15] shinydashboard_0.7.3 shiny_1.10.0        

loaded via a namespace (and not attached):
 [1] gtable_0.3.6        xfun_0.48           bslib_0.9.0         htmlwidgets_1.6.4   tzdb_0.4.0          vctrs_0.6.5         sourcetools_0.1.7-1
 [8] tools_4.4.1         crosstalk_1.2.1     generics_0.1.3      curl_6.2.1          pkgconfig_2.0.3     data.table_1.16.0   RColorBrewer_1.1-3 
[15] lifecycle_1.0.4     farver_2.1.2        compiler_4.4.1      munsell_0.5.1       fontawesome_0.5.3   httpuv_1.6.15       htmltools_0.5.8.1  
[22] sass_0.4.9          yaml_2.3.10         lazyeval_0.2.2      later_1.4.1         pillar_1.10.1       crayon_1.5.3        jquerylib_0.1.4    
[29] openssl_2.3.2       rsconnect_1.3.4     cachem_1.1.0        mime_0.12           tidyselect_1.2.1    digest_0.6.37       stringi_1.8.4      
[36] rprojroot_2.0.4     fastmap_1.2.0       grid_4.4.1          colorspace_2.1-1    cli_3.6.3           magrittr_2.0.3      withr_3.0.2        
[43] scales_1.3.0        promises_1.3.2      bit64_4.6.0-1       timechange_0.3.0    rmarkdown_2.29      httr_1.4.7          bit_4.5.0.1        
[50] askpass_1.2.1       hms_1.1.3           memoise_2.0.1       evaluate_1.0.3      knitr_1.49          viridisLite_0.4.2   rlang_1.1.4        
[57] Rcpp_1.0.13         xtable_1.8-4        glue_1.8.0          rstudioapi_0.17.1   jsonlite_1.9.1      R6_2.6.1     
