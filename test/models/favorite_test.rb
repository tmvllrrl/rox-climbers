# == Schema Information
#
# Table name: favorites
#
#  id          :bigint           not null, primary key
#  is_favorite :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  photo_id    :bigint
#  user_id     :bigint
#
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
