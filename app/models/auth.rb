class Auth < ActiveRecord::Base
  attr_accessible :nickname, :oauth_token, :oauth_token_secret, :user_id

  belongs_to :user
end
