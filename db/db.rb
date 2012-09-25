require "rubygems"
require "sequel"

# connect to an in-memory database
DB = Sequel.sqlite




#DB.drop_table(:movies)



# create an items table

DB.create_table :movies do
  primary_key :id
  String :title
  String :rating
  DateTime :release_date
  Text :description
end



movies = DB[:movies]

# populate the table
movies.insert(:title=>"Pechito en tanga", :rating=>"PG", :release_date=>"26-Oct-1984", :description=>"Bad Movie")
movies.insert(:title=>"Commander II", :rating=>"PG", :release_date=>"01-Jan-1998", :description=>"Bajo")
movies.insert(:title=>"El Ryche", :rating=>"RP", :release_date=>"12-Nov-1977", :description=>"Pancheada")




