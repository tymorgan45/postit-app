class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :votes
      t.string :voteable
      t.integer :user_id, :voteable_id
    end
  end
end
