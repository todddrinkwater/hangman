class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :value, unique: true, null: false
      t.belongs_to :game, null: false

      t.timestamps
    end
  end
end
