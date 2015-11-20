class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flash_cards do |t|
      t.text :question
      t.text :answer
      t.string :subject

      t.timestamps null: false
    end
  end
end
