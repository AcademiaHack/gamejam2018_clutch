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

  def update_name(name, session, game_id)
    if session.has_key?("score")
      user = Audience.find(session["id"])
      user.update_attribute(:game_id, game_id)
    else
      user = Player.find(session["id"])
      self.game.update(player1_id: session["id"]) if session["current_slot"].to_i == 0
      self.game.update(player2_id: session["id"]) if session["current_slot"].to_i == 1
    end
    user.update_attribute(:name, name)
    user
  end
end
