class Api::ArtistsController < Api::BaseController
  before_action :set_artist, only: [:show, :destroy, :update]

  def index
    artists = Artist.all
    render status: 200, json: artists
  end

  def show
    render status: 200, json: artist
  end

  def create
    artist = Artist.new(artist_params)

    if artist.save
      render status: 201, json: artist
    else
      render status: 422, json: {
        errors: artist.errors
      }.to_json
    end
  end

  def destroy
    artist.destroy

    render status: 200, json: {
      message: "Artist deleted"
    }.to_json
  end

  def update
    if artist.update(artist_params)
      render status: 200, json: artist
    else
      render status: 422, json: {
        message: "Artist could not be updated"
        errors: artist.errors
      }.to_json
    end
  end

  private

  def set_artist
    artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image)
  end
end
