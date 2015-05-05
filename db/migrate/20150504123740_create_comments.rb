class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, :post_id
      t.datetime :created_at, :updated_at
    end
  end
end
