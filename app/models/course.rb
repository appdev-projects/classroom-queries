class Course < ApplicationRecord

  def enrollments
    Enrollment.where({ :course_id => self.id })
  end

  def department
    Department.where({ :id => self.department_id }).first
  end

  def students
    Student.where({ :id => self.enrollments.pluck(:student_id) })
  end

end
