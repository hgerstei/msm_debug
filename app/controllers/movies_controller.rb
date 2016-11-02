class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    # don't need an action because of the way the files are structured; rails will look for file under movies
    # it's good to get in the habit of writing these things as you're still getting familiar
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    # render("show")
    redirect_to("/movies/#{@movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    # asdasd
    # render("show")
    redirect_to("/movies/" + @movie.id.to_s)
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
  end
end
