describe Department, "#course" do
  it "returns the students that are enrolled in the Course", points: 1 do
    department = Department.new
    department.save
    
    course = Course.new
    course.department_id = department.id
    course.save

    expect(department.courses).to match_array([])

  end
end
