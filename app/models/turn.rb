class Turn < ApplicationRecord
  belongs_to :game

  belongs_to :winner, class_name: 'Player', optional: true
  
  has_many :audiences
  has_many :turn_elements

  enum status: [:on_hold, :playing, :finished]
end
