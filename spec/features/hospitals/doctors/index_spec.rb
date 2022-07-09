require 'rails_helper'

RSpec.describe 'Hospital doctors index' do
    it 'shows the name of all doctors for that hospital' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        dr_seuss = childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        de_house = childrens.doctors.create(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)

        jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')

        visit "/hospitals/#{childrens.id}/doctors"

        expect(page).to have_content(dr_seuss.name)
        expect(page).to have_content(dr_house.name)

    end
    
    # it 'links to each doctors page'

end