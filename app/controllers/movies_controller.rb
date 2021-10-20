class MoviesController < ApplicationController
  before_action :require_user_to_be_admin!, only: [
    :new_view, :create, :admin_view , :remove, :activate
  ]
  before_action :set_movie, only: [
    :show_view, :deactive, :activate, :remove
  
  ]
  def index_view
    @movies = Movie.all
  end

  def show_view
    if !@movie.active
      redirect_to movies
    else
      @rentals = Rental.where(movie: @movie)
    end
  end

  def new_view
  end

  def admin_view
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(
      name: params[:name],
      description: params[:description]
    )
    if @movie.save
      @movie.photo.attach(params[:photo]) 
      flash[:notice] = "Added #{@movie.name} to registry"
      redirect_to movie_show_view_path(@movie)
    else
      flash[:alert] = @movie.errors.full_messages.to_sentence
      redirect_to movies_new_path
    end
  end

  def activate
    @movie.activate
    flash[:notice] = "Activated #{@movie.name}."
    redirect_to admin_path
  end

  def remove
    @movie.remove
    flash[:notice] = "Removed #{@movie.name}"
    redirect_to admin_path
  end


end
