class Game < ApplicationRecord
  has_many :players

  enum status: [:waiting_p1, :waiting_p2, :waiting_for_audience, :started, :ended]
end
