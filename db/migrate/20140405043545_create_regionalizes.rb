class CreateRegionalizes < ActiveRecord::Migration
  def change
    create_table :regionalizes do |t|
      t.integer :region_id
      t.integer :article_id

      t.timestamps
    end
  end
end
