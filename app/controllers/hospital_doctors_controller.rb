class HospitalDoctorsController < ApplicationController
    def index
        hospital = Hospital.find(params[:hospital_id])
        @doctors = hospital.doctors
    end
end