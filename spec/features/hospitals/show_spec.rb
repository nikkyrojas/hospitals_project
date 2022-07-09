require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'this page shows indvidual hospital with attributes and doctors' do
    before :each do 
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
    end
    
    it 'displays hospital' do

        visit "/hospitals/#{@childrens.id}"

        expect(page).to have_content(@childrens.name)
        expect(page).to_not have_content(@jude.name)
    end
  
    it 'displays individual hospital attributes' do

        visit "/hospitals/#{@childrens.id}"
        
        # save_and_open_page

        expect(page).to have_content(@childrens.phone)
        expect(page).to have_content(@childrens.location)
        expect(page).to have_content(@childrens.public)
        expect(page).to_not have_content(@jude.phone)
    end


    # it 'displays the name of all doctors' do
    #     childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
    #     dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
    #     dr_house = childrens.doctors.create!(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
    #     jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

    #     visit "/hospitals/#{@childrens.id}"

    #     expect(page).to have_content(dr_seuss.name)
    #     expect(page).to have_content(dr_house.name)
    # end


    # it 'links to each doctors page' do
    #     visit "/hospitals/#{@childrens.id}"
        
    #     click_on @dr_seuss.name

    #     expect(current_path).to eq("/doctors/#{@dr_seuss.id}")

    # end


end 