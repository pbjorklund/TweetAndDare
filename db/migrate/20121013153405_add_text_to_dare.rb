class AddTextToDare < ActiveRecord::Migration
  def change
    add_column :dares, :text, :string
  end
end
