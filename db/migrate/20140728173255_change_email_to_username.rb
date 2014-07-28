class ChangeEmailToUsername < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string, null: false, default: ""
    add_column :users, :username, :string, null: false, default: ""
  end
end
