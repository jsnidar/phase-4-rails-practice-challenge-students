class StudentsController < ApplicationController

  def index
    students = Student.all 
    render json: students 
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  def update
    student = Student.find(params[:id])
    student.update!(student_params)
    render json: student
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Student not found" }, status: :not_found
  end

  def create
    instructor = Instructor.find(params[:instructor_id])
    student = instructor.students.create!(student_params)
    render json: student, status: :created 
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Instructor not found" }, status: :not_found
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
  end

  private

  def student_params 
    params.permit(:name, :major, :age, :instructor_id)
  end
end
