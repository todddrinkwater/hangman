class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :guess
      t.belongs_to :game

      t.timestamps
    end
  end
end
