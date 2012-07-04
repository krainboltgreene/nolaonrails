class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments, id: false do |t|
      t.belongs_to :course
      t.belongs_to :account
    end
    add_index :enrollments, :course_id
    add_index :enrollments, :account_id
  end
end
