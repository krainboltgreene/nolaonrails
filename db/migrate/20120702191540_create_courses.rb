class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :body
      t.integer :price
      t.string :image, default: nil
      t.belongs_to :account

      t.timestamps
    end
    add_index :courses, :name
    add_index :courses, :account_id
  end
end
