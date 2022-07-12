require 'rails_helper'

RSpec.describe 'Hospital doctors index' do
    before :each do
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        @dr_seuss = @childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        @dr_house = @childrens.doctors.create(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        @dr_grey = @jude.doctors.create(name: 'Meredith Grey', probono: true, specialty: 'General Surgery', license: 346432,  hospital_id:2)
    end
    
    it 'displays the name of all doctors for that hospital' do
        visit "/hospitals/#{@childrens.id}/doctors"

        expect(page).to have_content(@dr_seuss.name)
        expect(page).to have_content(@dr_house.name)
    end
    
    it 'links to each doctors page' do
        visit "/hospitals/#{@childrens.id}/doctors"
        
        click_on @dr_seuss.name

        expect(current_path).to eq("/doctors/#{@dr_seuss.id}")
    end


end