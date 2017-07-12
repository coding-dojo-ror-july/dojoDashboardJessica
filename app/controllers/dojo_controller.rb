class DojoController < ApplicationController
    def index
        @dojos = Dojo.all 
        render "index"
    end  
    def new
        render "new" 
    end
    def create 
        @dojo = Dojo.new(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
        if @dojo.save
            redirect_to "/" 
        else 
            flash[:errors] = @dojo.errors.full_messages
            redirect_to "/dojos/new"
        end  
    end  
    def show
        @dojo = Dojo.find(params[:id])
        @cohort = @dojo.students
        render "show" 
    end 
    def edit
       @dojo = Dojo.find(params[:id])
       render "edit"    
    end      
    def update
        @dojo = Dojo.find(params[:id])
        if @dojo.update(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
            redirect_to "/"
        else
            flash[:errors] = @dojo.errors.full_messages
            redirect_to :back  
        end
    end
    def destroy
        @dojo = Dojo.find(params[:id]) 
        @dojo.delete 
        redirect_to "/"  
    end                 
end
