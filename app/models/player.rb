class Player < ApplicationRecord
  belongs_to :game

  has_many :audiences
  has_many :turn_elements
end
