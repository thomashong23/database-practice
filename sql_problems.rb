require 'sqlite3'

db = SQLite3::Database.open "test.db"

# you can follow any tutorial you'd like for syntax, but here's a simple one: https://www.w3schools.com/sql/default.asp

# EX syntax for solutions:

# db.execute("SQL QUERY HERE"
# ) do |row|
#   p row
# end 

# 1) get all columns from olympicMedals table 
p "Solution for 1"

p "###############################################################"

# 2) get year, season, discipline, athlete, country from olympicMedals table 
p "Solution for 2"

p "###############################################################"

# 3) get the distinct years that the olympic records show 
p "Solution for 3"

p "###############################################################"

# 4) get the records where the medal is gold 
p "Solution for 4"

p "###############################################################"

# 5) get the records for the summer olympics between 1950 - 2000
p "Solution for 5"

p "###############################################################"

# 6) get the records where a country won a silver or a gold
p "Solution for 6"

p "###############################################################"

# 7) get the records where a country won a gold and wasn't the united states 
p "Solution for 7"

p "###############################################################"

# 8) get the countries who won medals after 2000 and sort them alphabetically by country name
p "Solution for 8"

p "###############################################################"

# 9) find the records where the country is null 
p "Solution for 9"

# NOTE: normally in datasets, we don't want null values. from now on, make sure that country is NOT null

p "###############################################################"

# 10) find the min and max year in the data 
# as you print this solution out, it may not have enough information. 
# look into aliases! https://www.w3schools.com/sql/sql_alias.asp
p "Solution for 10"

p "###############################################################"

# 11) find how many medals each country has won sorting most medals
p "Solution for 11"

p "###############################################################"

# 12) get top 10 countries who have won the most gold medals in descending order
p "Solution for 12"

p "###############################################################"

# 13) get top 10 countries who have won the least medals in ascending order
p "Solution for 13"

p "###############################################################"

# 14) get top 10 countries by full country name who have won the most gold medals in descending order
p "Solution for 14"

p "###############################################################"

# 15) get top 10 countries by full country name and population, where the name is not null, that have won the most gold medals in descending order
p "Solution for 15"