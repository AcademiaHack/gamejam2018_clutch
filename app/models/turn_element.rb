class TurnElement < ApplicationRecord
  belongs_to :player
  belongs_to :turn
  belongs_to :element
end
