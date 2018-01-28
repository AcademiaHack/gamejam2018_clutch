class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :player1
      t.references :player2
      t.string :code

      t.timestamps
    end
  end
end
