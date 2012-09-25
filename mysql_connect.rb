require "rubygems"
require "sequel"


DB = Sequel.connect(:adapter => 'mysql', :user => 'root', :host => 'localhost', :database => 'rotten_potatoes',:password=>'root')



=begin
# create a dataset from the items table
movies = DB[:movies]

# populate the table
movies.insert(:title => 'Duro de matar', :description => "Una pelicula")

dataset = DB[:movies].
    select(:title, :description).
    where(:description => 'Una pelicula')



# print out the number of records
puts "la pelicula es: #{dataset.first}"
=end
