class AddPhotoFkColToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :photo, foreign_key: true
  end
end
