class CreateAudiences < ActiveRecord::Migration[5.1]
  def change
    create_table :audiences do |t|
      t.references :player, foreign_key: true
      t.references :turn, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
