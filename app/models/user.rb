class User < ActiveRecord::Base
 has_many :articles
 has_many :fweds, foreign_key:"follower_id", class_name:"Follow"
 has_many :fwers, foreign_key:"followed_id", class_name:"Follow"
 has_many :followers, through: :fwers
 has_many :following, through: :fweds, source:"followed"
 has_many :following_articles, through: :following, source:"articles"
 validates_presence_of :username
 validates_uniqueness_of :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  def self.find_for_facebook_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.provider.to_s+auth.uid.to_s
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
  end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name  = data["name"] if user.name.blank?
        user.surname = data["surname"] if user.surname.blank?
        user.uid=data["uid"] if user.uid.blank?
        user.provider=data["provider"] if user.provider.blank?
      end
    end
  end
end
