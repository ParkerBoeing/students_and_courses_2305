class Gradebook
  attr_reader :instructor, :courses, :list_all_students
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    students = {}
    courses.map do |course|
      students[course] = course.students
    end
    students
  end

  def students_below(threshold)
    below_threshold = []
    courses.each do |course|
      course.students.each do |student|
        if student.grade < threshold
          below_threshold << student
        else
        end
      end
    end
    below_threshold
  end

  def all_grades
    grade_map = {}
    grades = []
    courses.each do |course|
      grades = []
      course.students.each do |student| 
        grades << student.grade
      end
      grade_map[course] = grades
    end
    grade_map
  end

  def students_in_range(min, max)
  in_range = []
    courses.each do |course|
      course.students.each do |student|
        if student.grade < max && student.grade > min
        in_range << student
        else
        end
      end
    end
  in_range
  end
end
