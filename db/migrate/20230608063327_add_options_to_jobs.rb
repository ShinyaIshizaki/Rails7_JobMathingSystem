class AddOptionsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :from, :date
    add_column :jobs, :to, :date
    add_column :jobs, :place, :string
    add_column :jobs, :telework, :string
    add_column :jobs, :disability, :string
  end
end
