class FindStudents
  attr :students

  def initialize(students = nil)
    @students = students
  end

  def call(params = {})
    scoped = students
    scoped = filter_by_grade(scoped, params[:grade])
    scoped.order(name: :asc) unless scoped.nil?
  end

  private
  def filter_by_grade(scoped, grade)
    return scoped unless grade.present?

    Student.where(grade: grade)
  end
end