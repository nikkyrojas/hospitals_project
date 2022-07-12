
  require 'rails_helper'
  RSpec.describe "hospital edit/update" do
    before :each do
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        @dr_seuss = @childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1)
        @dr_house = @childrens.doctors.create(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1)
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        @dr_grey = @jude.doctors.create(name: 'Meredith Grey', probono: true, specialty: 'General Surgery', license: 346432,  hospital_id:2)
    end

    it 'has a link to edit a hospital' do
        visit "/hospitals"
        
        click_button "Update #{@childrens.name}"

        expect(current_path).to eq("/hospitals/#{@childrens.id}/update")
    end

    it 'can update the artist' do
        concentra = Hospital.create!(name: 'Conce433ra', public: true, phone: 643344, location: 'Aurora')
        visit "/hospitals"
        
        expect(page).to have_content('Conce433ra')

        click_button "Update #{concentra.name}"
        
        visit "/hospitals/#{concentra.id}/update"

        fill_in "Location", with: "Thorton"
        fill_in "Name", with: "Concentra"
        fill_in "Phone", with: "7965555"
        fill_in "Public", with: "True"
        click_on "Update Hospital"


        expect(current_path).to eq("/hospitals")
        expect(page).to have_content('Concentra')
        expect(page).to have_content('Thorton')
        expect(page).to have_content('7965555')
        

    end
end

    # it 'has a link to a form to update a hospital 
    #     when on the hospital show page ' do
    #     visit "/hospitals/#{@childrens.id}"
        
    #     click_link 'Update Hospital'

    #     expect(current_path).to eq("/hospitals/:id/update")

    #     fill_in "Location", with: "Thorton"
    #     fill_in "Name", with: "Concentra"
    #     fill_in "Phone", with: "7965555"
    #     fill_in "Public", with: "True"
    #     click_on "Update Hospital"

    #     expect(current_path).to eq("/hospitals")
    #     expect(page).to have_content("Concentra")
    #     expect(page).to have_content("Thorton")
    #     expect(page).to have_content("7965555")
    # end