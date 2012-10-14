class AddDaredUserIdToDare < ActiveRecord::Migration
  def change
    add_column :dares, :dared_user_id, :integer
  end
end
