require 'csv'

class StudentsController < ApplicationController
  def index
    @students = Student.all.order(name: :asc)
  end

  def show
    @student = Student.includes(:payments).find(params[:id])
    @payments = @student.payments.with_attached_payment_support.includes(:bill, :fees)
    @paid_months = @student.fees.pluck(:month)
    @partial_payment = calculate_partial_payments(@student)
  end

  def edit
    @student = Student.find(params[:id])
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

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy
    redirect_to students_path
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
  params.require(:student).permit(:name, :grade, :quota, :entry_date)
end

def calculate_partial_payments(student)
  return [] if student.payments.empty? 
  total_amount = student.total_payments_amount
  fees_paid = total_amount.to_f/student.quota
  
  fees_paid - fees_paid.to_i > 0.0 ? [student.fees.last.month] : []
end