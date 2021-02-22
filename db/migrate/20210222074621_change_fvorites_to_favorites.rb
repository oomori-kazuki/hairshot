class ChangeFvoritesToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :fvorites, :favorites
  end
end
