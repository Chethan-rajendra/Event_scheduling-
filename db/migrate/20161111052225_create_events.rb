class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :venu
      t.datetime :date
      t.datetime :time
      t.string :description
      t.string :invitees
      t.string :status
      t.references :host, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users, column: :host_id
  end
end
