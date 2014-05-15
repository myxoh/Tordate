class CreateConfigParams < ActiveRecord::Migration
  def change
    create_table :config_params do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
