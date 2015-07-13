class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :billable
      t.integer :hours
      t.integer :hourly_rate
      t.string :currency
      t.belongs_to :company, index: true

      t.timestamps
    end
  end
end
