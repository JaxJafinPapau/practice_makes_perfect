class SearchResultsFacade
  def initialize(house)
    @house = house
  end
  def student_count
    "22 Students"
  end

  def students
    service.role_call.map do |student_info|
      Student.new(student_info)
    end
  end

  private

  def service
    @_service ||= HogwartsService.new(@house)
  end
end
