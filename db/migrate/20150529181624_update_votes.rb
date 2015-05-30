class UpdateVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :votes, :vote
    rename_column :votes, :voteable, :voteable_type
    add_column :votes, :created_at, :datetime
    add_column :votes, :updated_at, :datetime
  end
end
