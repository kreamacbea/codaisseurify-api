require 'rails_helper'

describe "Showing the list of songs" do

  let!(:song1) { create :song, title: "Title 1" }
  let!(:song2) { create :song, title: "Title 2" }
  let!(:song3) { create :song, title: "Silly Title" }

  it "shows all his songs" do


    visit songs_url

    expect(page).to have_text("Title 1")
    expect(page).to have_text("Title 2")
  end
end
