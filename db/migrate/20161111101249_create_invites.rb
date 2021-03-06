class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
    add_foreign_key :invites, :users, column: :user_id
    add_foreign_key :invites, :events, column: :event_id
  end
end
