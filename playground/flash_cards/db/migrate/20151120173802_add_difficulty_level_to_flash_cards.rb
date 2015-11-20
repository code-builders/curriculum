class AddDifficultyLevelToFlashCards < ActiveRecord::Migration
  def change
    add_column :flash_cards, "level", :integer
  end
end
