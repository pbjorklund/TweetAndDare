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
    else # try to update tokens
      user.auth.update_attributes(oauth_token: omniauth.credentials.token, oauth_token_secret: omniauth.credentials.secret)
      user.save
    end
    user
  end

  def self.find_or_create! nickname
    user = User.find_by_nickname nickname
    unless user
      user = User.create({nickname: nickname })
    end
    user
  end

  def oauth_hash
    unless auth.nil?
      Hash[:oauth_token, auth.oauth_token, :oauth_token_secret, auth.oauth_token_secret]
    end
  end
  # Public: Connets to twitter using their client
  # based on the users oAuth credentials.
  #
  # Returns a Twitter Client instance.
  def twitter_client
    Twitter::Client.new(oauth_hash)
  end
end
