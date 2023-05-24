class Student
 attr_reader :name, :age, :scores

 def initialize(attributes)
  @name = attributes[:name]
  @age = attributes[:age]
  @scores = []
 end

 def log_score(score)
  @scores << score
 end

 def grade
  scores.sum.to_f / scores.length
 end

end
