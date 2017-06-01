class GenresController < ApplicationController
  def show
    # pull genre name from url params
    genre_type = params[:genre]
    # find all tips for that genre
    @tips = Tip.where(genre: genre_type)
  end

end
