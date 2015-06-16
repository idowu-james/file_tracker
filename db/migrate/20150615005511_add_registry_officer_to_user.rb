class AddRegistryOfficerToUser < ActiveRecord::Migration
   def change
    add_column :users, :registry_officer, :boolean ,:default => false
  end
end
