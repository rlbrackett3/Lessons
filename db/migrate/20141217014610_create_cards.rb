class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :type
      t.integer :cc_number
      t.integer :cc_code
      t.string :cc_name
      t.date :cc_date

      t.timestamps
    end
  end
end
