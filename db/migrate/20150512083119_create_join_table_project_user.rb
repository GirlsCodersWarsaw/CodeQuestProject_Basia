class CreateJoinTableProjectUser < ActiveRecord::Migration
  def change
    create_join_table :projects, :users do |t|
       t.index [:project_id, :user_id]
    end
  end
end
