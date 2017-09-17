class AddTokenToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :token, :string
  end
end
