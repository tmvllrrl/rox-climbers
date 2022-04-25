class AddPhotoFkColToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :photo, foreign_key: true
  end
end
