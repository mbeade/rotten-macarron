require 'rubygems'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__), 'models/movie')

use Rack::MethodOverride


configure do
  enable :sessions
end

get '/' do
 @movie = Movie.all
 haml :index
end



get "/favicon.ico" do
  ""
end


get '/new' do
  haml :new
end


get '/search-show' do
  haml :search
end

get '/search' do
  my_query = ""
  if !params[:title].to_s.empty?
    my_query << "title LIKE '#{params[:title]}%'"
  end

  if !params[:description].to_s.empty?
    if my_query.empty?
      my_query << " description LIKE '#{params[:description]}%'"
    else
      my_query << " and description LIKE '#{params[:description]}%'"
    end
  end

  if params[:rating] != "select"
    if my_query.empty?
      my_query << " rating= '#{params[:rating]}'"
    else
      my_query << " and rating= '#{params[:rating]}'"
    end
  end

  dataset = Movie.where(my_query)
  @movie = dataset.all
  haml :index
end

post '/add' do
  #Create a new instance of Movie < Sequel Model
  @movietmp = Movie.new
  #Add values passed as a parameter of the request to de array of values to the columns using symbols to represent each column name as an index of the array
  @movietmp[:title]=params[:title]
  @movietmp[:description]=params[:description]
  @movietmp[:rating]=params[:rating]
  @movietmp[:release_date]=params[:release]
  #save will insert a new record into the data base
  @movietmp.save
  #call the rute "/" to see the list
  redirect "/"
end

get "/sort" do

  if  session[:order] == :asc
    session[:order] = :desc
    dataset = Movie.select(:title, :description,:rating,:release_date).reverse_order(:title);
  else
    session[:order] = :asc
    dataset = Movie.select(:title, :description,:rating,:release_date).order(:title);
  end


  @movie = dataset.all
  haml :index
end


get "/:title" do
  dataset = Movie.select(:title, :description,:rating,:release_date).where(:title => "#{params[:title]}" ).order(:title);
  @movie = dataset.first
  haml :show
end


delete "/:id" do
  Movie[params[:id]].destroy
  @movie = Movie.all
  haml :index
end


get "/edit/:id" do
  @movietmp = Movie[params[:id]]
  haml :edit
end

put "/:id" do
  @movietmp = Movie[params[:id]]
  @movietmp[:title]=params[:title]
  @movietmp[:description]=params[:description]
  @movietmp[:rating]=params[:rating]
  @movietmp[:release_date]=params[:release]
  @movietmp.save
  redirect "/"
end


not_found do
  haml :notfound
end