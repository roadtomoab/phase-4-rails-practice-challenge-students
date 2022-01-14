class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index
        render json: Instructor.all
    end

    def show
        instructor = find_instructor
        render json: instructor 
    end

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = find_instructor
        instructor.update(instructor_params)
        render json: instructor
    end

    def destroy
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        Student.find(params[:id])
    end

    def render_not_found_message
        render json: { error: "instructor not found" }, status: :not_found 
    end
end
