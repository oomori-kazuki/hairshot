class RenameGeneralUserIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :general_user_id, :user_id
  end
end
