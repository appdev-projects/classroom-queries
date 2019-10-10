# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  graduation_year :integer
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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

  def year
    year = self.graduation_year - Date.today.year
    if year == 1
      return "Senior"
    elsif year == 2
      return "Junior"
    elsif year == 3
      return "Sophomore"
    elsif year == 4
      return "Freshman"
    else
      return "Alumni"
    end
  end

  def fall_classes
    self.courses.where({ :term_offered => "Fall" })
  end

  def winter_classes
    self.courses.where({ :term_offered => "Winter" })
  end

  def spring_classes
    self.courses.where({ :term_offered => "Spring" })
  end

  def summer_classes
    self.courses.where({ :term_offered => "Summer" })
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
