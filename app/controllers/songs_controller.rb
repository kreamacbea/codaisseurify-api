class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :show, :create, :edit, :update]

  def index
    @songs = artist.songs
    @song = Song.new
  end

  def show
    @song = artist.songs.find(params[:id])
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find(params[:artist_id])

    if @song.save!
      redirect_to @artist, notice: "Song added"
    else
      render :new, notice: "Something went wrong here. Wanna try again?"
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    artist = @song.artist
    @song.destroy

    redirect_to artists_path, notice: "Song deleted"
  end

  private

  def set_artist
    artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :length, :artist_id)
  end
end
