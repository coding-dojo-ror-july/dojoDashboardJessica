class StudentController < ApplicationController
    def new
        @dojo = Dojo.find(params[:id])
        @dojos = Dojo.all
        render "new"
    end  
    def create
        @dojo = Dojo.find(params[:id])
        @new = Student.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo: @dojo)
        if @new.save
            redirect_to "/dojos/#{@dojo.id}/students/#{@new.id}"
        else
            flash[:errors] = @student.errors.full_messages
            redirect_to :back 
        end
    end 
    def show
        # @cohort = Student.where(dojo_id=:dojo_id)
        @dojo = Dojo.find(params[:dojo_id])
        @cohort = @dojo.students
        @student = Student.find(params[:student_id])
        render "student"
    end 
     def destroy
        @student = Student.find(params[:student_id]) 
        @student.delete 
        redirect_to :back 
    end  
    def edit
        @student = Student.find(params[:student_id])
        @dojo = Dojo.find(params[:dojo_id])
        @dojos = Dojo.all
        render "edit"
    end  
    def update
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:student_id])
        if @student.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo: Dojo.find(params[:dojo]))
            redirect_to "/dojos/#{ @dojo.id }"
        else 
            flash[:errors] = @student.errors.full_messages
            redirect_to :back
        end
    end             
end
