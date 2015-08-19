require 'sinatra'
require_relative 'models/movie.rb'

#Index page routes to all movies
get '/' do
	erb :all_movies
end

# Create route to show all movies
get '/movies' do
	erb :all_movies
end

# Create route to show form for a new movie
get '/movies/new' do
	erb :new_movie
end

# Create route to create a new movie when form is submitted
post '/movies' do
	@movie = Movie.new
	@movie.title = params[:title]
	@movie.director = params[:director]
	@movie.rating = params[:rating]
	@movie.save
	erb :all_movies
end

# Create route to show one specific movie by ID
get '/movies/:id' do
	@movie_id = params[:id]
	erb :movie_info
end

# Create route to show form to edit one specific movie
get '/movies/:id/edit' do
	@movie_id = params[:id]
	erb :edit_movie
end

# Create route to update movie when edit form is submitted
put '/movies/:id' do
	@movie_id = params[:id]
	@movie = Movie.find(@movie_id)
	@movie.title = params[:title]
	@movie.director = params[:director]
	@movie.rating = params[:rating]
	erb :movie_info
end

# Create route to delete a movie 
delete '/movies/:id' do
	Movie.find(params[:id]).destroy
	erb :all_movies
end


