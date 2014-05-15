class Addpicturetoarticle < ActiveRecord::Migration
  def change
  add_attachment    :articles,   :picture
  end
end
