require 'rails_helper'

feature 'Add Songs', js: true do
  scenario 'add a new song' do
    visit artist_songs_path

    create 'song_title', with: 'Huilen is voor jou te laat'
    page.execute_script("$('form').submit()")

    expect(page).to have_content('Huilen is voor jou te laat')
  end
end
