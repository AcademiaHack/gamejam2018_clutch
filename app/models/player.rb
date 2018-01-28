# == Schema Information
#
# Table name: players
#
#  id             :integer          not null, primary key
#  name           :string
#  current_slot   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Player < ApplicationRecord
end
