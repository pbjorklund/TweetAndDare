class User < ActiveRecord::Base
  attr_accessible :uid, :nickname

  has_one :auth
  has_many :owning_dares, :class_name => "Dare", :foreign_key => :owner_id
  has_many :received_dares, :class_name => "Dare", :foreign_key => :dared_user_id

  def self.create_from_omniauth omniauth
    unless find_by_uid(omniauth.uid)
      user = self.create!( uid: omniauth.uid, nickname: omniauth.info.nickname)
      user.auth = Auth.new( oauth_token: omniauth.credentials.token, oauth_token_secret: omniauth.credentials.secret)
      user.save!
      user
    end
  end
end
