class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        if params[:tutor_id]
            tutor = Tutor.find(params[:tutor_id])
            courses = tutor.courses
        elsif params[:student_id]
            student = Student.find(params[:student_id])
            courses = Student.courses
        else
            courses = Course.all
        end
        render json: courses, except: [:created_at, :updated_at]
    end

    def show
        id = params[:id]
        course = Course.find(id)
        render json: course, except: [:created_at, :updated_at]
    end 

    def create
        course = Course.create(course_params)
        render json: course
    end
  
    def update
        id = params[:id]
        course = Course.find(id)
        course.update(course_params)
        render json: course
    end

    def destroy
        id = params[:id]
        course = Course.find(id)
        course.destroy
        render json: {message: "Course destroyed successfully"}
    end

    private

    def course_params
        params.permit(:title, :content, :likes, :student_id, :tutor_id)
    end

    def render_not_found_response
        render json: {error: "Course not found "},
        status: :not_found
    end

end
