class CoursesController < ApplicationController
    def index
        courses = Course.all
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

end
