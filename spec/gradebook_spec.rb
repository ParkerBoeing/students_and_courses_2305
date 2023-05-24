require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do 
  it 'exists' do
    gradebook = Gradebook.new("Dani")
    expect(gradebook).to be_a Gradebook
    expect(gradebook.instructor).to eq "Dani"
    expect(gradebook.courses).to eq []
  end
  
  it 'can add courses' do
    gradebook = Gradebook.new("Dani")
    calculus = Course.new("Calculus", 2)
    history = Course.new("History", 6)
    gradebook.add_course(calculus)
    gradebook.add_course(history)
    expect(gradebook.courses).to eq [calculus, history]
  end

  it 'can list all students enrolled in courses' do
    gradebook = Gradebook.new("Dani")
    calculus = Course.new("Calculus", 2)
    history = Course.new("History", 6)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Micah", age: 18})
    student4 = Student.new({name: "Joe", age: 22})
    student5 = Student.new({name: "Carter", age: 17})
    calculus.enroll(student1) 
    calculus.enroll(student2)
    history.enroll(student3)
    history.enroll(student4)
    history.enroll(student5)
    gradebook.add_course(calculus)
    gradebook.add_course(history)
    expected = {
      calculus => [student1, student2],
      history => [student3, student4, student5]
    }
    expect(gradebook.list_all_students).to eq expected
  end

  it 'can find all students below a given threshold' do
    gradebook = Gradebook.new("Dani")
    calculus = Course.new("Calculus", 2)
    history = Course.new("History", 6)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Micah", age: 18})
    student4 = Student.new({name: "Joe", age: 22})
    student5 = Student.new({name: "Carter", age: 17})
    student1.log_score(89)
    student1.log_score(78)
    student2.log_score(93)
    student2.log_score(99)
    student3.log_score(71)
    student3.log_score(53)
    student4.log_score(44)
    student4.log_score(68)
    student5.log_score(19)
    student5.log_score(27)
    calculus.enroll(student1) 
    calculus.enroll(student2)
    history.enroll(student3)
    history.enroll(student4)
    history.enroll(student5)
    gradebook.add_course(calculus)
    gradebook.add_course(history)
    expect(gradebook.students_below(75)).to eq [student3, student4, student5]
  end

  it 'can find all students in a given grade range' do
    gradebook = Gradebook.new("Dani")
    calculus = Course.new("Calculus", 2)
    history = Course.new("History", 6)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Micah", age: 18})
    student4 = Student.new({name: "Joe", age: 22})
    student5 = Student.new({name: "Carter", age: 17})
    student1.log_score(89)
    student1.log_score(78)
    student2.log_score(93)
    student2.log_score(99)
    student3.log_score(71)
    student3.log_score(53)
    student4.log_score(44)
    student4.log_score(68)
    student5.log_score(19)
    student5.log_score(27)
    calculus.enroll(student1) 
    calculus.enroll(student2)
    history.enroll(student3)
    history.enroll(student4)
    history.enroll(student5)
    gradebook.add_course(calculus)
    gradebook.add_course(history)
    expect(gradebook.students_in_range(75, 99)).to eq [student1, student2]
  end

  it 'can find all grades' do
    gradebook = Gradebook.new("Dani")
    calculus = Course.new("Calculus", 2)
    history = Course.new("History", 6)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Micah", age: 18})
    student4 = Student.new({name: "Joe", age: 22})
    student5 = Student.new({name: "Carter", age: 17})
    student1.log_score(89)
    student1.log_score(78)
    student2.log_score(93)
    student2.log_score(99)
    student3.log_score(71)
    student3.log_score(53)
    student4.log_score(44)
    student4.log_score(68)
    student5.log_score(19)
    student5.log_score(27)
    calculus.enroll(student1) 
    calculus.enroll(student2)
    history.enroll(student3)
    history.enroll(student4)
    history.enroll(student5)
    gradebook.add_course(calculus)
    gradebook.add_course(history)
    expected = {
      calculus => [83.5, 96],
      history => [62, 56, 23]
    }
    expect(gradebook.all_grades).to eq expected
  end
end
