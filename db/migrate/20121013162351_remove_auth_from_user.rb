class RemoveAuthFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :oauth_token
  	remove_column :users, :oauth_token_secret
  	remove_column :users, :nickname
  end

  def down
  	add_column :users, :oauth_token, :string
  	add_column :users, :oauth_token_secret, :string
  	add_column :users, :nickname, :string
  end
end