class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :guess, unique: true
      t.belongs_to :game

      t.timestamps
    end
  end
end
