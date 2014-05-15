class CreateCategorizes < ActiveRecord::Migration
  def change
    create_table :categorizes do |t|
      t.integer :category_id
      t.integer :article_id

      t.timestamps
    end
  end
end
