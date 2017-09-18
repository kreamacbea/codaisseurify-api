class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :show, :create, :edit, :update]

  def index
    @songs = artist.songs
    @song = Song.new
  end

  def show
    @songs = Song.all
    @song = Song.new
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find(params[:artist_id])

    respond_to do |format|
      if @song.save
        format.html { redirect_to artist_song_path, notice: "Song added" }
        format.json { render :show, status: :created, location: @artist.song }
      else
        format.html { render :new, notice: "Something went wrong here. Wanna try again?" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
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

    respond_to do |format|
      format.html { redirect_to artist_song_path, notice: "Song deleted" }
      format.json { render :show, status: :deleted, location: @artist.songs }
    end
  end

  private

  def set_artist
    artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :length, :artist_id)
  end
end
