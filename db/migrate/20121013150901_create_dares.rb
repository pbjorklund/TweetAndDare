class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|

      t.timestamps
    end
  end
end
