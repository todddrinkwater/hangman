class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :word
      t.integer :max_lives

      t.timestamps
    end
  end
end
