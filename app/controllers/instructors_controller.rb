class InstructorsController < ApplicationController

    def index
        render json: Instructor.all
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            render json: instructor, status: :ok
        else
            render json: {error: "Instructor not found"}, status: :not_found
        end
    end

    def create
        instructor = Instructor.create(name: params[:name])
        if instructor
            render json: instructor, status: :created
        else
            render json: {error: "invalid data"}, status: :unprocessable_entity
        end
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(name: params[:name])
            render json: instructor, status: :accepted
        else
            render json: {error: "Instructor not found"}, status: :not_found
        end

    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            header :no_content
        else
            render json: {error: "Instructor not found"}, status: :not_found
        end
    end

   
end
