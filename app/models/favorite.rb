# == Schema Information
#
# Table name: favorites
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  favorite_id :bigint
#  user_id     :bigint
#
class Favorite < ApplicationRecord
end
