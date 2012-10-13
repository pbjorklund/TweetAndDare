class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :nickname
      t.integer :user_id

      t.timestamps
    end
  end
end
