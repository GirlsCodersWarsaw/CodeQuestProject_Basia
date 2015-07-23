class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.string :user_role
      t.boolean :accepted
    end
    add_index :memberships, [ :project_id, :user_id ], unique: true, name: 'by_project_and_user'
  end
end
