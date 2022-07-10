class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.sorted_by_created_at
        
    end

    def show
        @hospital = Hospital.find(params[:id])
        @doctors = @hospital.doctors
    end

end

