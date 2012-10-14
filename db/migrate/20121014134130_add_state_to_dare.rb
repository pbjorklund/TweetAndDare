class AddStateToDare < ActiveRecord::Migration
  def up
  	add_column :dares, :state, :integer
  end

  def down
  	remove_column :dares, :state
  end
end
