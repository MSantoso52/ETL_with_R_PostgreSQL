# ETL_with_R_PostgreSQL
# *Overview*
Repository to perfrom ETL step by step, using R to conduct start from extracting - transforming - loading. Using CSV file as input & PostgreSQL as datawarehouse. This project how to using R language to conduct ETL in simplest way, hence using small sample just for demonstration. 
# *Prerequisites* 
To follow along with this project, you will need:

# *Project Flow*
The process following below steps:
- PostgreSQL server running
  ```bash
  sudo systemctl status postgresql
- R installed
  ```R
  R --version
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
   ```R
   # View the transformes data
   print(cars_transformed)
9. Create PostgreSQL connection -- passing the database, user, password, port, host
    ```R
   # Load 
   # Database connection
   con <-dbConnect(
      RPostgres::Postgres(),
      host = "localhost",
      dbname = "carsdata",
      user = "*****",
      password = "*****",
      port = 5432
   )
11. Load (L) -- write into table database, csv file
    ```R
    # Load data as csv file
    write.csv(cars_transformed, "cars.csv")
13. Close connection
    ```R
    # Close the database connection
    dbDisconnect(con)
