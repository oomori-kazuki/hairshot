class CreateFvorites < ActiveRecord::Migration[5.2]
  def change
    create_table :fvorites do |t|
      t.references :post, foreign_key: true
      t.references :general_user, foreign_key: true

      t.timestamps
    end
  end
end
