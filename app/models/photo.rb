# == Schema Information
#
# Table name: photos
#
#  id                :bigint           not null, primary key
#  route_description :string
#  route_grade       :string
#  route_location    :string
#  route_style       :string
#  route_title       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_photos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Photo < ApplicationRecord
    has_one_attached :route_image

    belongs_to(
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :photos
    )
end
