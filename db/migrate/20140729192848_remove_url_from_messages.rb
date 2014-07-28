class RemoveUrlFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :url
  end

  def down
    add_column :messages, :url, :string, default: "", null: false
  end
end
