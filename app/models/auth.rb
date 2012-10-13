class Auth < ActiveRecord::Base
  attr_accessible :oauth_token, :oauth_token_secret, :user_id

  belongs_to :user

  def twitter
  	Twitter::Client.new(
  		:oauth_token => oauth_token,
  		:oauth_token_secret => oauth_token_secret
  	)  	
  end
end
