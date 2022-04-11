class AddUserFkColToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_reference :photos, :user, foreign_key: true
  end
end
