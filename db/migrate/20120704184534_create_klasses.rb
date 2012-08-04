class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name, default: nil
      t.text :body, default: nil
      t.string :location, default: nil
      t.datetime :start_at, default: nil
      t.datetime :end_at, default: nil
      t.belongs_to :course
      t.belongs_to :location

      t.timestamps
    end
    add_index :klasses, :name
    add_index :klasses, :course_id
    add_index :klasses, :location_id
  end
end
