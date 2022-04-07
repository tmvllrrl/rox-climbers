class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :route_grade
      t.string :route_style
      t.string :route_title
      t.string :route_description
      t.string :route_location

      t.timestamps
    end
  end
end
