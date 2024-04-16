require 'csv'

class StudentsController < ApplicationController
  def index
    @students = Student.all.order(name: :asc)
  end

  def show
    @student = Student.includes(:payments).find(params[:id])
    @payments = @student.payments.with_attached_payment_support.includes(:bill)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def import_students
  end

  def create_csv
    file = CSV.read(params[:students_file])

    file.each do |row|
      Student.create(name: row[0], grade: row[1])
    end

    redirect_to students_path
  end
end

private
def student_params
  params.require(:student).permit(:name, :grade)
end