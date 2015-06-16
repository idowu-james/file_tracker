class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.references :nasfile, index: true
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :office_sent_to_id

      t.timestamps null: false
    end
    add_foreign_key :trackers, :nasfiles
  end
end
