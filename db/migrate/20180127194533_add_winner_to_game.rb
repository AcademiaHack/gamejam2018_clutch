class AddWinnerToGame < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :winner
  end
end
