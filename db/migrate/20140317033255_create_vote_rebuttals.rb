class CreateVoteRebuttals < ActiveRecord::Migration
  def change
    create_table :vote_rebuttals do |t|
      t.integer :user_id
      t.integer :rebuttal_id
      t.boolean :is_up

      t.timestamps
    end
  end
end
