require 'rails_helper'

RSpec.describe 'this page shows hospitals' do
    before :each do 
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        
    end
   
    it 'displays all hospitals with some attributes' do
        visit "/hospitals"
        # save_and_open_page

        expect(page).to have_content(@childrens.name)
        expect(page).to have_content(@childrens.location)
        expect(page).to have_content(@childrens.phone)
        expect(page).to have_content(@jude.name)
    end

        it 'has a link to each hospital' do
        visit "/hospitals"

        click_on @childrens.name

        expect(current_path).to eq("/hospitals/#{@childrens.id}")

    end
end