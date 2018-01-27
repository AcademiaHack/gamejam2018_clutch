class Game < ApplicationRecord
  has_many :players

  belongs_to :winner, class_name: 'Player', optional: true

  enum status: [:waiting_p1, :waiting_p2, :waiting_for_audience, :started, :ended]
end
