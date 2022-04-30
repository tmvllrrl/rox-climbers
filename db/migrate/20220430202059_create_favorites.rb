class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      #t.bigint :user_id
      t.bigint :favorite_id
      #t.bigint :photo_id
      t.boolean :is_favorite

      t.timestamps
    end
  end
end
