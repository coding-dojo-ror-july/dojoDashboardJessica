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
            flash[:error] = "All fields must be filled with at least 2 characters!"
            redirect_to "/dojos/new"
        end  
    end             
end
