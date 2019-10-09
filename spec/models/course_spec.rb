require "rails_helper"

describe Course, "#students" do
  it "returns the students that are enrolled in the Course", points: 1 do
    course = Course.new
    course.save

    first_student = Student.new
    first_student.save

    second_student = Student.new
    second_student.save

    third_student = Student.new
    third_student.save

    fourth_student = Student.new
    fourth_student.save

    fifth_student = Student.new
    fifth_student.save

    first_enrollement = Enrollment.new
    first_enrollement.course_id = course.id
    first_enrollement.student_id = first_student.id
    first_enrollement.save

    second_enrollement = Enrollment.new
    second_enrollement.course_id = course.id
    second_enrollement.student_id = third_student.id
    second_enrollement.save

    third_enrollement = Enrollment.new
    third_enrollement.course_id = course.id
    third_enrollement.student_id = fifth_student.id
    third_enrollement.save

    expect(course.students).to match_array([first_student, third_student, fifth_student])
  end
end

describe Course, "#enrollments" do
  it "returns the students that are enrolled in the Course", points: 1 do
    course = Course.new
    course.save

    other_course = Course.new
    other_course.save

    first_enrollement = Enrollment.new
    first_enrollement.course_id = course.id
    first_enrollement.save

    second_enrollement = Enrollment.new
    second_enrollement.course_id = other_course.id
    second_enrollement.save

    third_enrollement = Enrollment.new
    third_enrollement.course_id = course.id
    third_enrollement.save

    expect(course.enrollments).to match_array([first_enrollement, third_enrollement])
  end
end

describe Course, "#department" do
  it "returns the students that are enrolled in the Course", points: 1 do
    department = Department.new
    department.save

    course = Course.new
    course.department_id = department.id
    course.save

    expect(course.department).to eql(department)

  end
end
