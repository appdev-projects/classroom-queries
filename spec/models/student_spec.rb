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


describe Student, "#enrollments" do
  it "returns the courses that the student is enrolled in", points: 1 do

    student = Student.new
    student.save

    other_student = Student.new
    other_student.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.save

    other_enrollment = Enrollment.new
    other_enrollment.student_id = student.id
    other_enrollment.save

    not_this_enrollment = Enrollment.new
    not_this_enrollment.student_id = other_student.id
    not_this_enrollment.save

    expect(student.enrollments).to match_array([enrollment, other_enrollment])

  end
end

describe Student, "#courses" do
  it "returns the courses that the student is enrolled in", points: 1 do

    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    course = Course.new
    course.save
    
    not_this_course = Course.new
    not_this_course.save
    
    other_course = Course.new
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.courses).to match_array([course, other_course])

  end
end

describe Student, "#departments" do
  it "returns the courses that the student is enrolled in", points: 1 do

    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    math_department = Department.new
    math_department.name = "Math"
    math_department.save
  
    theater_department = Department.new
    theater_department.name = "Theater"
    theater_department.save
  
    physics_department = Department.new
    physics_department.name = "Physics"
    physics_department.save

    course = Course.new
    course.department_id = math_department.id
    course.save
    
    not_this_course = Course.new
    not_this_course.department_id = theater_department.id
    not_this_course.save
    
    other_course = Course.new
    other_course.department_id = physics_department.id
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.departments).to match_array([math_department, physics_department])

  end
end

describe Student, "#departments" do
  it "doesn't return duplicates", points: 1 do
    
    student = Student.new
    student.save
    
    other_student = Student.new
    other_student.save
    
    math_department = Department.new
    math_department.name = "Math"
    math_department.save
    
    theater_department = Department.new
    theater_department.name = "Theater"
    theater_department.save
    
    physics_department = Department.new
    physics_department.name = "Physics"
    physics_department.save
    
    course = Course.new
    course.department_id = math_department.id
    course.save
    
    not_this_course = Course.new
    not_this_course.department_id = theater_department.id
    not_this_course.save
    
    other_course = Course.new
    other_course.title = "Physics 101"
    other_course.department_id = physics_department.id
    other_course.save
    
    last_course = Course.new
    last_course.title = "Advanced Physics"
    last_course.department_id = physics_department.id
    last_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save
    
    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save
    
    expect(student.departments).to match_array([math_department, physics_department])
    
  end
end

describe Student, "#year" do
  it "returns approximate year based off of graduation year", points: 1 do
    student = Student.new
    student.graduation_year = Date.today.year + 4
    student.save

    expect(student.year).to eql("Freshman")
  end
end

describe Student, "#year" do
  it "returns approximate year based off of graduation year", points: 1 do
    student = Student.new
    student.graduation_year = Date.today.year + 3
    student.save

    expect(student.year).to eql("Sophomore")
  end
end

describe Student, "#year" do
  it "returns approximate year based off of graduation year", points: 1 do
    student = Student.new
    student.graduation_year = Date.today.year + 2
    student.save

    expect(student.year).to eql("Junior")
  end
end

describe Student, "#year" do
  it "returns approximate year based off of graduation year", points: 1 do
    student = Student.new
    student.graduation_year = Date.today.year + 1
    student.save

    expect(student.year).to eql("Senior")
  end
end

describe Student, "#year" do
  it "returns approximate year based off of graduation year", points: 1 do
    student = Student.new
    student.graduation_year = Date.today.year
    student.save

    expect(student.year).to eql("Alumni")
  end
end

describe Student, "#full_name" do
  it "returns students full name", points: 1 do
    student = Student.new
    student.first_name = "Chloe"
    student.last_name = "Price"
    student.save

    expect(student.full_name).to eql("Chloe Price")
  end
end

describe Student, "#fall_classes" do
  it "returns students fall courses", points: 1 do
    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    course = Course.new
    course.term_offered = "Fall"
    course.save
    
    not_this_course = Course.new
    not_this_course.term_offered = "Winter"
    not_this_course.save
    
    other_course = Course.new
    other_course.term_offered = "Fall"
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.fall_classes).to match_array([course, other_course])

  end
end

describe Student, "#winter_classes" do
  it "returns students winter courses", points: 1 do
    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    course = Course.new
    course.term_offered = "Winter"
    course.save
    
    not_this_course = Course.new
    not_this_course.term_offered = "Spring"
    not_this_course.save
    
    other_course = Course.new
    other_course.term_offered = "Winter"
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.winter_classes).to match_array([course, other_course])

  end
end

describe Student, "#spring_classes" do
  it "returns students spring courses", points: 1 do
    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    course = Course.new
    course.term_offered = "Spring"
    course.save
    
    not_this_course = Course.new
    not_this_course.term_offered = "Summer"
    not_this_course.save
    
    other_course = Course.new
    other_course.term_offered = "Spring"
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.spring_classes).to match_array([course, other_course])

  end
end

describe Student, "#summer_classes" do
  it "returns students summer courses", points: 1 do
    student = Student.new
    student.save

    other_student = Student.new
    other_student.save

    course = Course.new
    course.term_offered = "Summer"
    course.save
    
    not_this_course = Course.new
    not_this_course.term_offered = "Fall"
    not_this_course.save
    
    other_course = Course.new
    other_course.term_offered = "Summer"
    other_course.save
    
    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = student.id
    enrollment.course_id = other_course.id
    enrollment.save

    enrollment = Enrollment.new
    enrollment.student_id = other_student.id
    enrollment.course_id = other_course.id
    enrollment.save

    expect(student.summer_classes).to match_array([course, other_course])

  end
end

