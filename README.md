# Classroom Queries

## Standard Workflow

 1. Set up the project: `bin/setup`
 1. Start the web server by clicking "Run Project".
 1. Navigate to your live application preview.
 1. As you work, remember to navigate to `/git` and **commit often as you work.**
 1. Make new branches freely to experiment! _Especially_ before starting on a new task.
 1. Run `rails grade` as often as you like to see how you are doing, but **make sure you test your app manually first to make sure it matches the target's behavior first**.

## Methods to define

### Course.fall
Should return all the records in the Course table that are offered in the Fall term

### Course.winter
Should return all the records in the Course table that are offered in the Winter term

### Course.spring
Should return all the records in the Course table that are offered in the Spring term

### Course.summer
Should return all the records in the Course table that are offered in the Summer term

### Course#enrollments
Should return all the records in the Enrollment table that belong to the current Course

### Course#students
Should return all the records in the Student table that belong to the current Course

### Course#department
Should return the record in the Department table that belong to the current Course

### Department#enrollments
Should return all the records in the Enrollment table that belong to the current Department

### Department#courses
Should return all the records in the Course table that belong to the current Department

### Department#students
Should return all the records in the Student table that belong to the current Department

### Student#enrollments
Should return all the records in the Enrollments table that belong to the current Student

### Student#courses
Should return all the records in the Course table that belong to the current Student

### Student#departments
Should return all the unique records in the Departments table that belong to the current Student

### Student#fall_classes
Should return all the records in the Course table that belong to the current Student and are offered if Fall Term.

### Student#winter_classes
Should return all the records in the Course table that belong to the current Student and are offered if Fall Term.

### Student#spring_classes
Should return all the records in the Course table that belong to the current Student and are offered if Fall Term.

### Student#summer_classes
Should return all the records in the Course table that belong to the current Student and are offered if Fall Term.

### Student#year
Should return "Freshman", "Sophomore", "Junior", "Senior", or "Alumnus" based on the current year and the current Student's graduation_year.
