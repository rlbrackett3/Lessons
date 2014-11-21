class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.text :bio
      t.boolean :admin
      t.datetime :dob

      t.timestamps
    end
  end
end
