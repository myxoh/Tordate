class CreateCommentRebuttals < ActiveRecord::Migration
  def change
    create_table :comment_rebuttals do |t|
      t.integer :user_id
      t.integer :parent_comment
      t.integer :rebuttal_id
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
