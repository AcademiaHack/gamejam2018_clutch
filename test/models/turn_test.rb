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

require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
