class CreateDummies < ActiveRecord::Migration
  def change
    create_table :dummies do |t|
      t.string :foobar

      t.timestamps
    end
  end
end
