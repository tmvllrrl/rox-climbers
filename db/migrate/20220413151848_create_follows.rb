class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.bigint :user_id
      t.bigint :follow_id

      t.timestamps
    end
  end
end
