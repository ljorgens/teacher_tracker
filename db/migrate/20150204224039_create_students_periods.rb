class CreateStudentsPeriods < ActiveRecord::Migration
  def change
    create_table(:periods_students) do |t|
      t.column(:student_id, :integer)
      t.column(:period_id, :integer)

      t.timestamp
    end
  end
end
