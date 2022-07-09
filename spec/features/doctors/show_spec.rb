require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'this page shows doctors' do
    it 'shows the name of all doctors for that hospital with some attributes' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        de_house = childrens.doctors.create(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
        jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

        visit "/hospitals/#{childrens.id}/doctors"

        expect(page).to have_content(dr_seuss.name)
        expect(page).to have_content(dr_seuss.specialty)
        expect(page).to have_content(dr_house.name)
        expect(page).to have_content(dr_house.specialty)


    end
    
    
    it 'displays indvidual hospital' do
        hospital = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        hospital_2 = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
        visit "/hospitals/#{hospital.id}"
        
        save_and_open_page

        expect(page).to have_content(hospital.name)
        expect(page).to_not have_content(hospital_2.name)

    end
  
    it 'displays individual hospital attributes' do
        hospital = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        hospital_2 = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
        visit "/hospitals/#{hospital.id}"
        
        save_and_open_page

        expect(page).to have_content(hospital.phone)
        expect(page).to have_content(hospital.location)
        expect(page).to have_content(hospital.public)
        expect(page).to_not have_content(hospital_2.phone)
        

    end
    


end 