class CreateJoinTableUsersAddresses < ActiveRecord::Migration
  def change
    create_join_table :users, :addresses, table_name: :user_addresses do |t|
      # t.index [:user_id, :address_id]
      # t.index [:address_id, :user_id]
    end
  end
end
