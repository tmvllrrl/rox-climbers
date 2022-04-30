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
class Favorite < ApplicationRecord

    belongs_to(
        :photo,
        class_name: 'Photo',
        foreign_key: 'photo_id'
      )
    
      belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id'
      )
    
end
