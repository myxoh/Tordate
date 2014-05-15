class CreateVoteComments < ActiveRecord::Migration
  def change
    create_table :vote_comments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.boolean :is_up

      t.timestamps
    end
  end
end
