class User < ActiveRecord::Base
  attr_accessible :uid, :nickname, :image

  has_one :auth
  has_many :owning_dares, :class_name => "Dare", :foreign_key => :owner_id
  has_many :received_dares, :class_name => "Dare", :foreign_key => :dared_user_id

  validates :nickname, uniqueness: true

  def self.create_or_find_from_omniauth omniauth
    user = find_by_uid(omniauth.uid)
    unless  user
      user = self.create!( uid: omniauth.uid, nickname: omniauth.info.nickname, image: omniauth.info.image)
      user.auth = Auth.new( oauth_token: omniauth.credentials.token, oauth_token_secret: omniauth.credentials.secret)
      user.save!
    end
    user
  end
end
