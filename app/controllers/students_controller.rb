class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        students = Student.all
        render json: students, only: [:id, :name, :grade]
    end

    def show
        id = params[:id]
        student = Student.find(id)
        render json: student
    end 

    def create
        student = Student.create(student_params)
        render json: student
    end
  
    def update
        id = params[:id]
        student = Student.find(id)
        student.update(student_params)
        render json: student
    end

    def destroy
        id = params[:id]
        student = Student.find(id)
        student.destroy
        render json: {message: "Student destroyed successfully"}
    end

    private

    def student_params
        params.permit(:name, :grade)
    end

    def render_not_found_response
        render json: { error: "Student not found" },
        status: :not_found
    end

end
