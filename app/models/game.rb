# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  player1_id :integer
#  player2_id :integer
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  belongs_to :player1, class_name: 'Player', optional: true
  belongs_to :player2, class_name: 'Player', optional: true
  has_many :turns
  has_many :audiences

  before_create { self.code = SecureRandom.hex(5) }
end
