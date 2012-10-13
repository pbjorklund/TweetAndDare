class MoveNicknameToUser < ActiveRecord::Migration
  def up
  	remove_column :auths, :nickname
  	add_column :users, :nickname, :string
  end

  def down
  	remove_column :users, :nickname
  	add_column :auths, :nickname, :string
  end
end
