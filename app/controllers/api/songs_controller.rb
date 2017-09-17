class Api::SongsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_artist, only: [:show, :create, :update]

  def show
    render status: 200, json: {
      song: song
    }.to_json
  end

  def create
    song = Song.new(song_params)

    if song.save
      render status: 201, json: {
        message: "Song succesfully created",
        song: song
      }.to_json
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
      render status: 200, json: {
        message: "Song updated"
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
