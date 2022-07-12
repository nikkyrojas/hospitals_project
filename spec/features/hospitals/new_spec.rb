  require 'rails_helper'

  RSpec.describe "create new hospitals" do
    it 'has a link to a form to add a hospital' do
        visit "/hospitals"
        
        click_link 'Add Hospital'

        expect(current_path).to eq("/hospitals/new")
        visit "/hospitals/new"

        fill_in "Name", with: "Concentra"
        click_button "Create Hospital"

        new_hospital_id= Hospital.last.id

        expect(current_path).to eq("/hospitals")
        expect(page).to have_content("Concentra")
    end
end