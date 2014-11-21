class CreateJoinTableUserSomething < ActiveRecord::Migration
  def change
    create_join_table :users, :somethings do |t|
      # t.index [:user_id, :something_id]
      # t.index [:something_id, :user_id]
    end
  end
end
