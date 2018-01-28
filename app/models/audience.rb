# == Schema Information
#
# Table name: audiences
#
#  id             :integer          not null, primary key
#  name           :string
#  score          :integer
#  current_slot   :integer
#  game_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Audience < ApplicationRecord
  belongs_to :game
end