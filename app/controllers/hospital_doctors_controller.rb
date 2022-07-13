class HospitalDoctorsController < ApplicationController
    def index
        @hospital = Hospital.find(params[:hospital_id])
        @doctors = @hospital.doctors
    end

    def new
        @hospital_id = Hospital.first[:id]
        # binding.pry
        # @hospital = Hospital.find(params[:hospital_id])
        # # @doctors = @hospital.doctors
        # # binding.pry
        # # @hospital = Hospital.find(params[:hospital_id])
        # # @doctors = @hospital.doctors
    end

    def create
        @doctor = Doctor.create(doctor_params)
        hospital = Hospital.find(params[:hospital_id])
        @doctor[:hospital_id] = hospital.id
        return @doctor
        redirect_to "/hospitals/#{hospital.id}/doctors"
       
    end

    private
    def doctor_params
        binding.pry
        params.permit(:name, :specialty, :probono, :license)
    end

end
