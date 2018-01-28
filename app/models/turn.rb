# == Schema Information
#
# Table name: turns
#
#  id              :integer          not null, primary key
#  element_player1 :string
#  element_player2 :string
#  element_winner  :string
#  game_id         :integer
#  stop_player1    :boolean
#  stop_player     :boolean
#  slot            :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Turn < ApplicationRecord
  belongs_to :game

  def take_slot(player)
    current_slot = slot
    puts "ANTES!!! #{current_slot}"
    update_attribute(:slot, slot + 1)
    puts "DESPUES!!! #{slot}"
    { player: player, turn: self, slot: current_slot }
  end
end
