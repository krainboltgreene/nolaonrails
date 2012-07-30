class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, default: nil
      t.text :body, default: nil
      t.integer :price, default: 0
      t.string :image, default: nil
      t.integer :enrollment_limit, default: 0
      t.boolean :published, default: false
      t.boolean :finished, default: false
      t.belongs_to :account
      t.belongs_to :location

      t.timestamps
    end
    add_index :courses, :name
    add_index :courses, :enrollment_limit
    add_index :courses, :price
    add_index :courses, :published
    add_index :courses, :finished
    add_index :courses, :account_id
    add_index :courses, :location_id
  end
end
