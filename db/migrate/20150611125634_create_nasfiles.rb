class CreateNasfiles < ActiveRecord::Migration
  def change
    create_table :nasfiles do |t|
      t.string :file_name, null: false
      t.string :file_number, null: false
      t.integer :file_sub
      t.integer :file_vol
      t.references :category, index: true
      t.text :file_description

      t.timestamps null: false
    end
    add_index :nasfiles, :file_name
    add_index :nasfiles, :file_number
    add_foreign_key :nasfiles, :categories
  end
end
