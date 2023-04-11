class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name, null: false, unique: true
      t.string :source, null: false
      t.string :destination, null: false
      t.timestamps
    end
    
    add_index :routes, :name, unique: true
  end
end
