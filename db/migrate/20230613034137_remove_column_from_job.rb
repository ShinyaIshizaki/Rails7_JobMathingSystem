class RemoveColumnFromJob < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :disability
  end
end
