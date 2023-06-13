class ChangeColumnTypeInJob < ActiveRecord::Migration[7.0]
  def up
    change_column :jobs, :disability, :text, array: true, default: [], using: "disability::text[]"
  end
  def down
    change_column :jobs, :disability, :text
  end
end
