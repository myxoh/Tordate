class CreateRebuttles < ActiveRecord::Migration
  def change
    create_table :rebuttles do |t|
      t.string :headling
      t.string :header
      t.integer :score
      t.integer :user_id
      t.integer :article_id
      t.text :body

      t.timestamps
    end
  end
end
