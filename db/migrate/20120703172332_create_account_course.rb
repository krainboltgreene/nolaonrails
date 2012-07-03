class CreateAccountCourse < ActiveRecord::Migration
  def change
    create_table :accounts_courses, :id => false do |t|
      t.belongs_to :account, :course
    end

    add_index :accounts_courses, [:account_id, :course_id]
  end
end
