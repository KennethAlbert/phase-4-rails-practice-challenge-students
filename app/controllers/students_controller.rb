class StudentsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound,with: :instructor_not_found


def index
render json:Student.all,status: :ok
end

def show

render json:find_student,status: :ok
end


def create
student=Student.create!(student_params)
render json:student,status: :created
end

def update
student=find_student
student.update(student_params)
render json:instructor,status: :created
end

def destroy 
student=find_student.destroy
render json:{},status: :ok
end

private

def student_params
params.permit(:name,:major,:age,:instructor_id)
end

def student_not_found
render json:{error:"Student not found"},status: :not_found
end

def find_student
Student.find(params[:id])
end

end
