class AddOfficeSendingToTracker < ActiveRecord::Migration
  def change
  	add_column :trackers, :office_sent_from_id, :integer,after: :nasfile_id
  end
end
