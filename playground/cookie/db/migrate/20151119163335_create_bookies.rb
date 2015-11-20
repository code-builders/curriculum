class CreateBookies < ActiveRecord::Migration
  def change
    create_table :bookies do |t|
      t.text :ingredients
      t.text :instructions

      t.timestamps null: false
    end
  end
end
