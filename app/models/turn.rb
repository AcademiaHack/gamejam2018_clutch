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

  def take_slot(user)
    user.update_attribute(:current_slot, slot)
    update_attribute(:slot, slot + 1)
    user
  end
end
