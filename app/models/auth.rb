class Auth < ActiveRecord::Base
  attr_accessible :oauth_token, :oauth_token_secret, :user_id
  belongs_to :user

  validates :oauth_token, presence: true
  validates :oauth_token_secret, presence: true

end
