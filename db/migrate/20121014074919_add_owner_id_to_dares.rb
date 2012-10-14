class AddOwnerIdToDares < ActiveRecord::Migration
  def change
    add_column :dares, :owner_id, :integer
  end
end
