class HospitalDoctorsController < ApplicationController
    def index
        @hospital = Hospital.find(params[:hospital_id])
        @doctors = @hospital.doctors
    end

    def new
        @hospital = Hospital.find(params[:hospital_id])
        # @doctors = @hospital.doctors
        # binding.pry
        # @hospital = Hospital.find(params[:hospital_id])
        # @doctors = @hospital.doctors
    end
    
    # private
    # def doctor_params
    #     params.permit(:name, :specialty, :probono, :license)
    # end

end
 