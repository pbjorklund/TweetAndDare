class RenameOauthTokens < ActiveRecord::Migration
  def up
					rename_column :users, :auth_token, :oauth_token
					rename_column :users, :auth_token_secret, :oauth_token_secret
  end

  def down
					rename_column :users, :oauth_token, :auth_token
					rename_column :users, :oauth_token_secret, :auth_token_secret
  end
end
