class Game < ApplicationRecord
  belongs_to :player1, class_name: 'Player', optional: true
  belongs_to :player2, class_name: 'Player', optional: true
  has_many :turns
  has_many :audiences

  before_create { self.code = SecureRandom.hex(5) }
end
