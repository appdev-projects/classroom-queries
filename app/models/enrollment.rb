class Enrollment < ApplicationRecord

  def student
    Student.where({ :id => self.student_id }).first
  end

  def course
    Course.where({ :id => self.course_id }).first
  end

end
