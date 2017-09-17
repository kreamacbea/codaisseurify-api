class Api::SongsController < Api::BaseController
  before_action :set_artist, only: [:show, :create, :update]

  def index
    songs = Song.all
    render status: 200, json: songs
  end

  def show
    render status: 200, json: song
  end

  def create
    song = Song.new(song_params)

    if song.save
      render status: 201, json: song
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    song.destroy

    render status: 200, json: {
      message: "Song deleted"
    }.to_json
  end

  def update
    if song.update(song_params)
      render status: 200, json: song
      }.to_json
    else
      render status: 422, json: {
        message: "Song could not be updated"
        errors: song.errors
      }.to_json
    end
  end

  private

  def set_artist
    artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :length)
  end
end
