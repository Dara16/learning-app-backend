class TutorsController < ApplicationController

    def index
        tutors = Tutor.all
        render json: tutors, only: [:id, :name]
    end

    def show
        id = params[:id]
        tutor = Tutor.find(id)
        render json: tutor
    end 

    def create
        tutor = Tutor.create(tutor_params)
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

end