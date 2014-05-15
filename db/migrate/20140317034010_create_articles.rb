class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headling
      t.string :header
      t.integer :score
      t.integer :region_id
      t.integer :language_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
