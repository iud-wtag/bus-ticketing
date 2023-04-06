class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :name, null: false, unique: true
      t.integer :typed, null: false
      t.string :brand, null: false
      t.integer :capacity, default:0, null: false
      t.timestamps
    end

    add_index :buses, :name, unique: true
  end
end
