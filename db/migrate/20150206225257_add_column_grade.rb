class AddColumnGrade < ActiveRecord::Migration
  def change
    add_column(:periods_students, :grade, :string)
  end
end
