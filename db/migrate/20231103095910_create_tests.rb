class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
