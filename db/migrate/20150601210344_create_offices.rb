class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name, unique: true
      t.references :department, index: true

      t.timestamps null: false
    end
    add_foreign_key :offices, :departments
  end
end
