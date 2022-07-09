class DoctorsController < ApplicationController
    def index
        hospital = Hospital.find(params[:id])
        @doctors = hospital.doctors
    end
end