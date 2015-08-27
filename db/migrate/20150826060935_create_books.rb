class CreateBooks < ActiveRecord::Migration
  def change
    drop_table :books
    create_table :books do |t|
      t.string :title
      t.integer :rating

      t.timestamps null: false
    end
  end
end
