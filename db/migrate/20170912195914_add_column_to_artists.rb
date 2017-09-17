class AddColumnToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :remote_image_url, :string
  end
end
