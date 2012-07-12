class AddEnrollmentLimitToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :enrollment_limit, :integer, default: 0
    add_index :courses, :enrollment_limit
  end
end
