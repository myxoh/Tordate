class CreateCounterevidences < ActiveRecord::Migration
  def change
    create_table :counterevidences do |t|
      t.string :url
      t.string :description
      t.integer :score
      t.integer :article_id

      t.timestamps
    end
  end
end
