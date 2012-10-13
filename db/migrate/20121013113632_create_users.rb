class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :auth_token
      t.string :auth_token_secret

      t.timestamps
    end
  end
end
