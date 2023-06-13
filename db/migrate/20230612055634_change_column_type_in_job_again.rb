class ChangeColumnTypeInJobAgain < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :jobs, :disability, :boolean
    end
    def down
      change_column :jobs, :disability, :text, array: true, default: [], using: "disability::text[]"
    end
  end
end
