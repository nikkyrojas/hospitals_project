class DoctorsHospitalsController < ApplicationController
    def show
        @hospital = Hospital.find(params[:doctor_id])
        @doctors = @hospital.doctors
    end
   
end