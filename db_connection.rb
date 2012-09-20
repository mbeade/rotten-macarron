require "rubygems"
require "sequel"

# connect to an in-memory database
DB = Sequel.sqlite

# create an items table
DB.create_table :movie do
  primary_key :id
  String :title
  String :rating
  Date :release
  String :description
end

# create a dataset from the items table
items = DB[:movie]

# populate the table
items.insert(:title => 'Duro de matar', :rating => 'R', :release => '05/07/2011', :description => "Una pelicula")

dataset = DB[:movie].
    select(:title, :description).
    where(:rating => 'R')



# print out the number of records
puts "Item count: #{dataset.first}"

