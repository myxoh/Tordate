class CreateVoteEvidences < ActiveRecord::Migration
  def change
    create_table :vote_evidences do |t|
      t.integer :user_id
      t.integer :evidence_id
      t.boolean :is_up

      t.timestamps
    end
  end
end
