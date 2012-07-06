class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :body
      t.integer :price
      t.string :image, default: nil
      t.belongs_to :account
      t.belongs_to :location

      t.timestamps
    end
    add_index :courses, :name
    add_index :courses, :account_id
    add_index :courses, :location_id
  end
end
