class Articlereports < ActiveRecord::Migration
  def change
  add_column   :articles,  :reportev,  :integer
  add_column   :articles,  :reportco,  :integer
  end
end
