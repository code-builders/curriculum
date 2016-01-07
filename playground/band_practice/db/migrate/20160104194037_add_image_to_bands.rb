class AddImageToBands < ActiveRecord::Migration
  def change
    add_column :bands, :image_file, :string
  end
end
