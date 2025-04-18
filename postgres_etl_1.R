# Load necessary library
library(RPostgres)
library(dplyr)

# Extract
data(mtcars)
cars_df <- as.data.frame(mtcars)

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

# View the transformes data
print(cars_transformed)

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

dbWriteTable(
  con,
  "mtcars",
  cars_transformed, 
  overwrite = TRUE,
  row.names = TRUE
)

# Close the database connection
dbDisconnect(con)
