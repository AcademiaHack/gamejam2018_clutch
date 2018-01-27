class Turn < ApplicationRecord
  belongs_to :game
  
  has_many :audiences
  has_many :turn_elements

  enum status: [:on_hold, :playing, :finished]
end
