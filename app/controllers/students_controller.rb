class StudentsController < ApplicationController
   
   def index
    render json: Student.all
   end

   def show
    student = student.find_by(id: params[:id])
    if student
        render json: student, status: :ok
    else
        render json: {error: "Student not found"}, status: :not_found
    end
   end

   def create
    student = Student.create(student_params)
    if student
        render json: student, status: :created
    else
        render json: {error: "Invalid info"}, status: :unprocessable_entity
    end
   end

   def update
    student = Student.find_by(id: params[:id])
    if student
        student.update(student_params)
        render json: student, status: :accepted
    else
        render json: {error: "Student not found"}, status: :not_found
    end
   end

   def destroy
    student = Student.find_by(id: params[:id])
    if student
      student.destroy
      header :no_content   
    else
      render json: {error: "Student not found"}, stauts: :not_found
    end
   end

   private
   def student_params
    params.permit(:name, :major, :age, :instructor_id)
   end
end
