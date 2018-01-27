class CreateTurns < ActiveRecord::Migration[5.1]
  def change
    create_table :turns do |t|
      t.integer :status
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
