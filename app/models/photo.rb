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
#
class Photo < ApplicationRecord
    has_one_attached :route_image
end
