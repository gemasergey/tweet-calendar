class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.boolean :admin
      t.string :password_digest
      t.index(:username, unique: true)
      t.timestamps null: false
    end
  end
end
