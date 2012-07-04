class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :name
      t.text :body
      t.belongs_to :course

      t.timestamps
    end
    add_index :sessions, :name
    add_index :sessions, :course_id
  end
end
