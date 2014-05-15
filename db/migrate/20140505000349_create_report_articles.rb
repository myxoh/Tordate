class CreateReportArticles < ActiveRecord::Migration
  def change
    create_table :report_articles do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :report_type

      t.timestamps
    end
  end
end
