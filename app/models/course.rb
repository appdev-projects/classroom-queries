# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  term_offered  :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

class Course < ApplicationRecord

  def Course.fall
    Course.where({ :term_offered => "Fall"})
  end

  def Course.winter
    Course.where({ :term_offered => "Winter"})
  end

  def Course.spring
    Course.where({ :term_offered => "Spring"})
  end

  def Course.summer
    Course.where({ :term_offered => "Summer"})
  end

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
