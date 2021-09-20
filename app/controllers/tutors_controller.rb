class TutorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        tutors = Tutor.all
        render json: tutors, only: [:id, :name]
    end

    def show
        id = params[:id]
        tutor = Tutor.find(id)
        render json: tutor, include: :courses
    end 

    def create
        tutor = Tutor.create(tutor_params)
        render json: tutor
    end

    def update
        id = params[:id]
        tutor = Tutor.find(id)
        Tutor.update(tutor_params)
        render json: tutor
    end

    def destroy
        id = params[:id]
        tutor = Tutor.find(id)
        tutor.destroy
        render json: {message: "Tutor destroyed successfully"}
    end

    private

    def tutor_params
        params.permit(:name)
    end

    def render_not_found_response
        render json: { error: "Tutor not found" },
        status: :not_found
    end
end