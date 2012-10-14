class AddTargetToDare < ActiveRecord::Migration
  def change
    add_column :dares, :target, :string
  end
end
