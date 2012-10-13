class ChangeNameOnUser < ActiveRecord::Migration
  def up
					rename_column :users, :name, :uid
  end

  def down
					rename_column :users, :uid, :name
  end
end
