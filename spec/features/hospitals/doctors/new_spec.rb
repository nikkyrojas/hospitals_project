  require 'rails_helper'

  RSpec.describe "create new doctors" do
    it 'has a link to a form to add a doctor' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-06-13 15:58:46")
        visit "/hospitals/#{childrens.id}/doctors"
        
        click_link 'Add Doctor'

        expect(current_path).to eq("/hospitals/#{childrens.id}/doctors/new")
    end

    it 'it creates a doctor' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-06-13 15:58:46")
        visit "/hospitals/#{childrens.id}/doctors/new"

        fill_in "Name", with: "Phil McGraw"
        click_button "Add Doctor"

        expect(current_path).to eq("/hospitals/#{childrens.id}/doctors")
    end
   
    it 'it redirect back to page with doctor added' do
        childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-06-13 15:58:46")
        visit "/hospitals/#{childrens.id}/doctors/new"

        fill_in "Name", with: "Phil McGraw"
        fill_in "License", with: "453786"
        fill_in "Probono", with: "false"
        click_button "Add Doctor"

        expect(page).to have_content("Phil McGraw")
    end
end