class CreateVoteArticles < ActiveRecord::Migration
  def change
    create_table :vote_articles do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_up

      t.timestamps
    end
  end
end
