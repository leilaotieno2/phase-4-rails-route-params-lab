class StudentsController < ApplicationController

  def index
    students = Student.all

    if params[:query].present?
      query = params[:query].downcase
      students = students.where('lower(first_name) LIKE ? OR lower(last_name) LIKE ?', "%#{query}%", "%#{query}%")
    end

    render json: students
  end

  def grades
    students = Student.order(grade: :desc).first
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
