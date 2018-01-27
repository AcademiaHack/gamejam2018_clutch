class CreateTurnElements < ActiveRecord::Migration[5.1]
  def change
    create_table :turn_elements do |t|
      t.references :player, foreign_key: true
      t.references :turn, foreign_key: true
      t.references :element, foreign_key: true

      t.timestamps
    end
  end
end
