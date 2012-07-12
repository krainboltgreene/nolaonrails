class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :name, default: nil
      t.text :body, default: nil
      t.belongs_to :course
      t.belongs_to :location

      t.timestamps
    end
    add_index :meets, :name
    add_index :meets, :course_id
    add_index :meets, :location_id
  end
end
