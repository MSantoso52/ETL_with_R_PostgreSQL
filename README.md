# ETL_with_R_PostgreSQL
ETL process using R and load PostgreSQL database

Using R for ETL pipeline, the process following below steps:

1. Load necessary R library -- RPostgreSQL, dplyr
2. Extract (E) --
3. Transform (T) -- remove duplicates, remove empty fields, correction the data type
4. Display transform result
5. Create PostgreSQL connection -- passing the database, user, password, port, host
6. Load (L) -- write into table database, csv file
7. Close connection
