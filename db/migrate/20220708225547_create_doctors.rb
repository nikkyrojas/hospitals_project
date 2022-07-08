class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.integer :license
      t.boolean :probono

      t.timestamps
    end
  end
end
