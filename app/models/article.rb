class Article < ActiveRecord::Base
has_attached_file :picture, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
belongs_to :user
has_many :evidence
has_many :counterevidence
has_many :categorizes
has_many :votes, class_name:"VoteArticle"
has_many :categories, :through => :categorizes
has_many :regionalizes
belongs_to :language
has_many :regions, :through => :regionalizes

end
