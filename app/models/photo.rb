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

require 'elasticsearch/model'

class Photo < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    has_one_attached :route_image

    validates :route_grade, inclusion: { in: ["V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "5.6", "5.7", "5.8", "5.9", "5.10", "5.11", "5.12", "5.13"]}

    belongs_to(
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :photos
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: 'photo_id',
        inverse_of: :photo,
        dependent: :destroy
      )

    has_many(
        :likes,
        class_name: 'Like',
        foreign_key: 'photo_id',
        inverse_of: :photo,
        dependent: :destroy
    )
    has_many(
        :favorites,
        class_name: 'Favorite',
        foreign_key: 'photo_id',
        inverse_of: :photo,
        dependent: :destroy
    ) 

end
