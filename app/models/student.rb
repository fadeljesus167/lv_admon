class Student < ApplicationRecord
  has_many :payments
  has_many :fees

  def self.grades
    return ['Maternal', '1er Nivel', '2do Nivel', '3er Nivel', '1er Grado', '2do Grado', '3er Grado', '4to Grado', '5to Grado', '6to Grado', '1er Año', '2do Año', '3er Año', '4to Año', '5to Año']
  end
end
