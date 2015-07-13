class AddUserRefToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :user, index: true
  end
end
