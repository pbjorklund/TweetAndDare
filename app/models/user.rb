class User < ActiveRecord::Base
  attr_accessible :oauth_token, :oauth_token_secret, :uid, :nickname

  def twitter
  	Twitter::Client.new(
  		:oauth_token => oauth_token,
  		:oauth_token_secret => oauth_token_secret
  	)
  end
end