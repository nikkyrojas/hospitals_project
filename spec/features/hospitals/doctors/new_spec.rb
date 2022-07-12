  require 'rails_helper'

  RSpec.describe "create new doctors" do
    it 'has a link to a form to add a doctor' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-06-13 15:58:46")
        visit "/hospitals/#{childrens.id}/doctors"
        
        click_link 'Add Doctor'

        expect(current_path).to eq("/hospitals/#{childrens.id}/doctors/new")
        # visit "/hospitals/new"

        # fill_in "Name", with: "Phil McGraw"
        # click_button "Create Hospital"

        # new_hospital_id= Hospital.last.id

        # expect(current_path).to eq("/hospitals")
        # expect(page).to have_content("Concentra")
    end
end