class Category < ActiveRecord::Base
has_many :categorizes
has_many :articles, :through => :categorizes
end
