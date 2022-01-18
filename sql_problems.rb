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
db.execute("SELECT * FROM olympicMedals LIMIT 5"
 ) do |row|
   p row
 end 
p "###############################################################"

# 2) get year, season, discipline, athlete, country from olympicMedals table 
p "Solution for 2"
db.execute("SELECT year, season, discipline, athlete, country FROM olympicMedals LIMIT 5"
  ) do |row|
    p row
  end 
p "###############################################################"

# 3) get the distinct years that the olympic records show 
p "Solution for 3"

db.execute("SELECT DISTINCT year FROM olympicMedals LIMIT 5"
) do |row|
  p row
end
p "###############################################################"

# 4) get the records where the medal is gold 
p "Solution for 4"
db.execute("SELECT * FROM olympicMedals WHERE Medal IS 'Gold' LIMIT 5"
) do |row|
  p row
end
p "###############################################################"

# 5) get the records for the summer olympics between 1950 - 2000
p "Solution for 5"
db.execute("SELECT * FROM olympicMedals WHERE season IS 'Summer' AND year >= 1950 AND year <= 2000 LIMIT 5"
  ) do |row|
    p row
  end
p "###############################################################"

# 6) get the records where a country won a silver or a gold
p "Solution for 6"
db.execute("SELECT DISTINCT Country FROM olympicMedals WHERE medal IS 'Gold' OR medal IS 'Silver' LIMIT 5"
  ) do |row|
    p row
  end
p "###############################################################"

# 7) get the records where a country won a gold and wasn't the united states 
p "Solution for 7"
db.execute("SELECT Country FROM olympicMedals WHERE medal IS 'Gold' AND NOT country IS 'United States' LIMIT 5"
  ) do |row|
    p row
  end
p "###############################################################"

# 8) get the countries who won medals after 2000 and sort them alphabetically by country name
p "Solution for 8"
db.execute("SELECT Country FROM olympicMedals WHERE year>2000 ORDER BY country DESC LIMIT 5"
  ) do |row|
    p row
  end
p "###############################################################"

# 9) find the records where the country is null 
p "Solution for 9"
db.execute("SELECT * FROM olympicMedals WHERE country IS NULL LIMIT 5"
  ) do |row|
    p row
  end
# NOTE: normally in datasets, we don't want null values. from now on, make sure that country is NOT null

p "###############################################################"

# 10) find the min and max year in the data 
# as you print this solution out, it may not have enough information. 
# look into aliases! https://www.w3schools.com/sql/sql_alias.asp
p "Solution for 10"
db.execute("SELECT MIN(year), MAX(year) FROM olympicMedals LIMIT 5"
  ) do |row|
    p row
  end
p "###############################################################"

# 11) find how many medals each country has won sorting most medals
p "Solution for 11"
db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals GROUP BY country ORDER BY medal DESC LIMIT 30"
  ) do |row|
    p row
  end
p "###############################################################"

# 12) get top 10 countries who have won the most gold medals in descending order
p "Solution for 12"
db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals WHERE medal IS 'Gold' GROUP BY country ORDER BY medal DESC LIMIT 10"
  ) do |row|
    p row
  end
p "###############################################################"

# 13) get top 10 countries who have won the least medals in ascending order
p "Solution for 13"
db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals GROUP BY country ORDER BY medal ASC LIMIT 10"
  ) do |row|
    p row
  end
p "###############################################################"

# 14) get top 10 countries by full country name who have won the most gold medals in descending order
p "Solution for 14"
db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals INNER JOIN dictionary ON olympicMedals.country=code.country GROUP BY code ORDER BY medal DESC LIMIT 10"
  ) do |row|
    p row
  end
p "###############################################################"

# 15) get top 10 countries by full country name and population, where the name is not null, that have won the most gold medals in descending order
p "Solution for 15"
