class UpdateColumnsOfUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :phone, :string, default: "", null: false
      t.index :email, unique: true
      t.index :user_name, unique: true
    end
  end
end
