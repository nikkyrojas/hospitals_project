require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'this page displays doctors' do
    it 'displays the name of all doctors with some attributes' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        dr_house = childrens.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
        jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

        visit "/doctors"

        expect(page).to have_content(dr_seuss.name)
        expect(page).to have_content(dr_seuss.specialty)
        expect(page).to have_content(dr_house.name)
        expect(page).to have_content(dr_house.specialty)
    end
    
    
    it 'displays indvidual doctor with attributes' do
        children = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        dr_seuss = children.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        dr_house = children.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
        
        visit "/doctors/#{dr_seuss.id}"
        

        expect(page).to have_content(dr_seuss.name)
        expect(page).to have_content(dr_seuss.probono)
        expect(page).to have_content(dr_seuss.specialty)
        expect(page).to_not have_content(dr_house.name)
        expect(page).to_not have_content(dr_house.probono)
        expect(page).to_not have_content(dr_house.license)
    end

    it 'links to each doctors page' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124)
        dr_house = childrens.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466)
        jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

        visit "/doctors"

        click_on dr_seuss.name

        expect(current_path).to eq("/doctors/#{dr_seuss.id}")
    end

    # it 'links to all hospitals' do
    #     childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
    #     dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124)
    #     dr_house = childrens.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466)
    #     jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

    #     visit "/doctors"

    #     click_on href="/hospitals"

    #     expect(current_path).to eq("/hospitals")
    # end

    

end 