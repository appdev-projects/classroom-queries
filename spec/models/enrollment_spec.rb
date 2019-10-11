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

require "rails_helper"

describe Enrollment, "#student" do
  it "returns the student that the enrollment belongs to", points: 1 do
    course = Course.new
    course.save

    student = Student.new
    student.save

    enrollment = Enrollment.new
    enrollment.course_id = course.id
    enrollment.student_id = student.id
    enrollment.save

    expect(enrollment.student).to eq(student)
  end
end

describe Enrollment, "#course" do
  it "returns the course that the enrollment belongs to", points: 1 do
    course = Course.new
    course.save

    student = Student.new
    student.save

    enrollment = Enrollment.new
    enrollment.course_id = course.id
    enrollment.student_id = student.id
    enrollment.save

    expect(enrollment.course).to eq(course)
  end
end
