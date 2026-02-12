class FindStudents
  attr :students

  def initialize(students = nil)
    @students = students
  end

  def call(params = {})
    scoped = students
    scoped = filter_by_grade(scoped, params[:grade])
    scoped = search_by_query_text(scoped, params[:query_text])
    scoped.order(name: :asc) unless scoped.nil?
  end

  private
  def filter_by_grade(scoped, grade)
    return scoped unless grade.present?

    Student.where(grade: grade)
  end

  def search_by_query_text(scoped, query_text)
    return scoped unless query_text.present?

    Student.where("name LIKE ?", "%#{query_text}%")
  end
end