class User < ActiveRecord::Base
  attr_accessible :uid

  has_one :auth

  def twitter
  	Twitter::Client.new(
  		:oauth_token => oauth_token,
  		:oauth_token_secret => oauth_token_secret
  	)
  end
end