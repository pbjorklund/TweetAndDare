class AddDefaultValueToDareState < ActiveRecord::Migration
  def up
  	change_column :dares, :state, :integer, :default => 0
  end

  def down
  	change_column :dares, :state, :integer
  end
end
