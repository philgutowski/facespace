class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :url, default: "", null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
