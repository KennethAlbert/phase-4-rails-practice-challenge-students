class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound,with: :instructor_not_found


def index
render json:Instructor.all,status: :ok
end

def show
instructor=find_instructor
render json:instructor,status: :ok
end


def create
instructor=Instructor.create!(instructor_params)
render json:instructor,status: :created
end

def update
instructor=find_instructor
instructor.update(instructor_params)
render json:instructor,status: :created
end

def destroy 
instructor=find_instructor.destroy
render json:{},status: :ok
end

private

def instructor_params
params.permit(:name)
end

def instructor_not_found
render json:{error:"Instructor not found"},status: :not_found
end

def find_instructor
Instructor.find(params[:id])
end


end
