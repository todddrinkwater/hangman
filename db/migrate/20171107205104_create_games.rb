class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :word, null: false
      t.integer :max_lives, null: false

      t.timestamps
    end
  end
end
