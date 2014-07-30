class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :message_id, null: false
      t.timestamps null: false
    end
    add_index :votes, :user_id
    add_index :votes, :message_id
  end
end
