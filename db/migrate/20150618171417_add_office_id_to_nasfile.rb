class AddOfficeIdToNasfile < ActiveRecord::Migration
  def change
  	add_column :nasfiles, :office_id, :integer
  end
end
