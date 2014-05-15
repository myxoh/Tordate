class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :shortname
      t.string :longname

      t.timestamps
    end
  end
end
