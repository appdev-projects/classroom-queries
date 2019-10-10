# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  student_id :integer
#

class Enrollment < ApplicationRecord

  def student
    Student.where({ :id => self.student_id }).first
  end

  def course
    Course.where({ :id => self.course_id }).first
  end

end
