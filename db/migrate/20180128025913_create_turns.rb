class CreateTurns < ActiveRecord::Migration[5.1]
  def change
    create_table :turns do |t|
      t.string :element_player1
      t.string :element_player2
      t.string :element_winner
      t.references :game, foreign_key: true
      t.boolean :stop_player1
      t.boolean :stop_player
      t.integer :slot, default: 0

      t.timestamps
    end
  end
end
