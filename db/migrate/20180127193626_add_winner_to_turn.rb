class AddWinnerToTurn < ActiveRecord::Migration[5.1]
  def change
    add_reference :turns, :winner
  end
end
