class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path, notice: "Artist added"
    else
      render :new, notice: "Your attempt to add this artist failed. Please try again!"
    end
  end

  def update
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist = Artist.find(params[:id]).destroy

    if @artist.delete
      redirect_to artists_path, notice: "Artist deleted"
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image)
  end
end
