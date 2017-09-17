class RenameColumnArtists < ActiveRecord::Migration[5.1]
  def change
    rename_column :artists, :remote_image_url, :image
  end
end
