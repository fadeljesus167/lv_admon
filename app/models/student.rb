class Student < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :fees, dependent: :destroy

  def self.grades
    return ['Maternal', '1er Nivel', '2do Nivel', '3er Nivel', '1er Grado', '2do Grado', '3er Grado', '4to Grado', '5to Grado', '6to Grado', '1er Año', '2do Año', '3er Año', '4to Año', '5to Año']
  end

  def total_payments_amount
    payments.pluck(:amount, :rate).map { |a,r| a/r }.sum
  end
end
