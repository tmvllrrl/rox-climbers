# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  is_like    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
    belongs_to(
        :photo,
        class_name: 'Photo',
        foreign_key: 'photo_id',
        inverse_of: :likes
      )
end
