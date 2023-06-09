class AddDetailsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :skill_frontend, :string
    add_column :jobs, :skill_backend, :string
    add_column :jobs, :skill_infra, :string
  end
end
