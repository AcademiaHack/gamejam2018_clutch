class CreateAudiences < ActiveRecord::Migration[5.1]
  def change
    create_table :audiences do |t|
      t.string :name
      t.integer :score
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
