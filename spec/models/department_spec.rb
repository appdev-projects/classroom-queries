# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Department, "#courses" do
  it "returns the students that are enrolled in the Course", points: 1 do
    department = Department.new
    department.save

    other_department = Department.new
    other_department.save
    
    course = Course.new
    course.department_id = department.id
    course.save
    
    not_this_course = Course.new
    not_this_course.department_id = other_department.id
    not_this_course.save

    other_course = Course.new
    other_course.department_id = department.id
    other_course.save

    expect(department.courses).to match_array([course, other_course])

  end
end
