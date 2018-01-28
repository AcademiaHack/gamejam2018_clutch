# == Schema Information
#
# Table name: audiences
#
#  id         :integer          not null, primary key
#  name       :string
#  score      :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AudienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
