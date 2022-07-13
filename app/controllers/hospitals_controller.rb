class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.sorted_by_created_at
        
    end

    def show
        @hospital = Hospital.find(params[:id])
        @doctors = @hospital.doctors
    end
    
    def new
    end

    def create
        Hospital.create(hospital_params)
        redirect_to "/hospitals"
        # Hospital.create(name: params[:name]) is the syntax 
        #to just have onee attribute)
    end

    def update
        @hospital = Hospital.find(params[:id])
       
        # @hospital.update(hospital_params)
        # redirect_to "/hospitals/:id"
        # redirect_to "/hospitals/#{new_hospital_id}"
    end

    def updated
        @hospital = Hospital.find(params[:id])
        @hospital.update(hospital_params)
        redirect_to "/hospitals"
    end

private
    def hospital_params
        params.permit(:name, :location, :phone, :public)
    end
end

