require "sqlite3"
require "csv"

# Method to insert into table since the 
def insert_olympic_medal_record(db, season, record)
  p "creating record for #{record}"

  db.execute(
    "INSERT INTO olympicMedals 
    (
      year, 
      season, 
      city, 
      sport, 
      discipline, 
      athlete,
      country, 
      gender, 
      event, 
      medal
    )
    VALUES (
      ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
    )", 
    [
      record.field("Year"), 
      season, 
      record.field("City"), 
      record.field("Sport"), 
      record.field("Discipline"),
      record.field("Athlete"),
      record.field("Country"),
      record.field("Gender"),
      record.field("Event"),
      record.field("Medal")
    ]
  )
end

# Open a database
db = SQLite3::Database.new "test.db"

# Create olympic medals table
db.execute <<-SQL
  CREATE TABLE olympicMedals (
    year int,
    season varchar(50),
    city varchar(50),
    sport varchar(50),
    discipline varchar(50),
    athlete varchar(50),
    country varchar(50),
    gender varchar(50),
    event varchar(50),
    medal varchar(50)
  );
SQL

# Create country lookup table
db.execute <<-SQL
  CREATE TABLE countryLookup (
    country_name varchar(50),
    code varchar(50),
    population int,
    gdp_per_capita real
  );
SQL

# Write olympic medal records from CSV to table
summer_sports = CSV.parse(File.read("summer.csv"), headers: true)
winter_sports = CSV.parse(File.read("winter.csv"), headers: true)

p "populating olympicMedal table"

summer_sports.each do |record|
  insert_olympic_medal_record(db, "Summer", record)
end

winter_sports.each do |record|
  insert_olympic_medal_record(db, "Winter", record)
end

# Write country dictionary to lookup table 
dictionary = CSV.parse(File.read("dictionary.csv"), headers: true)

p "##########################################"
p "populating countryLookup table"

dictionary.each do |record| 
  p "creating record for #{record}"
  db.execute(
    "INSERT INTO countryLookup 
    (
      country_name, 
      code, 
      population,
      gdp_per_capita 
    )
    VALUES (
      ?, ?, ?, ?
    )",
    [
      record.field("Country"),
      record.field("Code"),
      record.field("Population"),
      record.field("GDP per Capita"),
    ]
  )
end
