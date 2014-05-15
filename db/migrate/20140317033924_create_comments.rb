class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :parent_comment
      t.integer :article_id
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
