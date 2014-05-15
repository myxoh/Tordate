class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.string :url
      t.string :description
      t.integer :score
      t.integer :article_id

      t.timestamps
    end
  end
end
