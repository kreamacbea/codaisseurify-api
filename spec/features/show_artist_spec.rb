require 'rails_helper'

describe "Viewing an individual artist" do
  let(:artist) { create :artist }

  it "shows the artist's details" do
    visit event_url(artist)

    expect(page).to have_text(artist.name)
  end
end
