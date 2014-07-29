class AddLastSeenAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_seen_at, :datetime, null: true
    update("UPDATE users SET last_seen_at = updated_at")
    change_column_null :users, :last_seen_at, false
  end
end
