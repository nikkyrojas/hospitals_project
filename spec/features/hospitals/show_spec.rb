require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'this page shows hospitals' do
    it 'displays all hospital' do
        hospital = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        hospital_2 = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
        visit "/hospitals"
        save_and_open_page

        expect(page).to have_content(hospital.name)
        expect(page).to have_content(hospital_2.name)

    end
    
    it 'displays indvidual hospital' do
        hospital = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        hospital_2 = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
        visit "/hospitals/#{hospital.id}"
        
        save_and_open_page

        expect(page).to have_content(hospital.name)
        expect(page).to_not have_content(hospital_2.name)

    end
    
    # it 'displays the name of hospital the doctor works at ' do
    #     hospital = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
    #     doctor = hospital.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics')
    #     doctor_2 = hospital.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine')
        
    #     visit "/doctors/#{doctor.id}"
    #     save_and_open_page

    #     expect(page).to have_content(hospital.name)
    
    # end


end 