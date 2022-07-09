class HospitalDoctorsController < ApplicationController
    def index
        binding.pry
        hospital = Hospital.find(params[:hospital_id])
        binding.pry
        @doctors = hospital.doctors
    end
end