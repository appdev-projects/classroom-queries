class Student < ApplicationRecord

  def enrollments
    Enrollment.where({ :student_id => self.id })
  end

  def courses 
    Course.where({ :id => self.enrollments.pluck(:course_id) })
  end

  def departments
    Department.where({ :id => self.courses.pluck(:department_id) })
  end
end
