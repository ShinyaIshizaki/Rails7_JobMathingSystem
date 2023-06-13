class AddCulomnToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :physical, :boolean
    add_column :jobs, :intellectual, :boolean
    add_column :jobs, :psychological, :boolean
    add_column :jobs, :developmental, :boolean
  end
end
