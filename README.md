# ETL_with_R_PostgreSQL
# *Overview*
Repository to perfrom ETL step by step, using R to conduct start from extracting - transforming - loading. Using CSV file as input & PostgreSQL as datawarehouse. This project how to using R language to conduct ETL in simplest way, hence using small sample just for demonstration. 

# *Project Flow*
The process following below steps:
1. Load necessary R library -- RPostgreSQL, dplyr
   ```R
   library(RPostgres)
   library(dplyr)
3. Extract (E) -- using R dataset as data frame
   ```R
   # Extract
   data(mtcars)
   cars_df <- as.data.frame(mtcars)
5. Transform (T) -- remove duplicates, remove empty fields, correction the data type
   ```R
   # Transform
   cars_transformed <- cars_df %>%
   # Remove duplicate
   distinct() %>%
   #  Remove any NA values
   na.omit() %>%
   # Ensure the format are correct:
   mutate(
    mpg = as.numeric(mpg),
    cyl = as.integer(cyl),
    disp = as.numeric(disp),
    hp = as.numeric(hp),
    drat = as.numeric(drat),
    wt = as.numeric(wt),
    qsec = as.numeric(qsec),
    vs = as.integer(vs),
    am = as.integer(am),
    gear = as.integer(gear),
    carb = as.integer(carb)
   )
7. Display transform result
8. Create PostgreSQL connection -- passing the database, user, password, port, host
9. Load (L) -- write into table database, csv file
10. Close connection
