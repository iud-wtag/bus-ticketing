class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :name, :string, default: "", null: false
      t.change :email, :string, default: "", null: false
      t.change :password, :string, default: "", null: false
      t.change :phone, :string, default: false, null: false
      t.change :role, :boolean, default: 0, null: false
      t.change :user_name, :string, default: "", null: false
    end
  end
end
