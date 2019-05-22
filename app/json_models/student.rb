class Student
  attr_reader :name,
              :id
  def initialize(student_info)
    @name = student_info["name"]
    @id = student_info["id"]
  end
end
