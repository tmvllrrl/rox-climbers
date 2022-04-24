class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.boolean :is_like

      t.timestamps
    end
  end
end
