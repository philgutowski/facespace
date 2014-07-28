class AddImageToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :image, :string, default: "", null: false
  end
end
