# == Schema Information
#
# Table name: favorites
#
#  id          :bigint           not null, primary key
#  is_favorite :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  favorite_id :bigint
#  photo_id    :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_favorites_on_photo_id  (photo_id)
#  index_favorites_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (photo_id => photos.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
