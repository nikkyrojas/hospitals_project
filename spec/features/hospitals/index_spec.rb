require 'rails_helper'

RSpec.describe 'this page shows hospitals' do
    before :each do 
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-06-13 15:58:46")
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver', created_at: "2022-06-11 15:58:46")
        @rose = Hospital.create!(name: 'Rose Medical', public: false, phone: 3045454, location: 'Denver', created_at: "2022-06-10 15:58:46")
        
    end
   
    it 'displays all hospitals with some attributes' do
        visit "/hospitals"
        # save_and_open_page

        expect(page).to have_content(@childrens.name)
        expect(page).to have_content(@childrens.location)
        expect(page).to have_content(@childrens.created_at)
        expect(page).to have_content(@childrens.phone)
        expect(page).to have_content(@jude.name)
        expect(page).to have_content(@jude.created_at)
    end

    it 'has a link to each hospital' do
        visit "/hospitals"

        click_on @childrens.name

        expect(current_path).to eq("/hospitals/#{@childrens.id}")
    end

    # it 'displays ordered hospitals by time they were created (most recent first)' do
    #     visit "/hospitals"
    #      save_and_open_page

    #     within '#hospitals-0' do
    #         expect(page).to have_content('Childrens Hospital')
    #     end

    #     within '#hospitals-1' do
    #      expect(page).to have_content('Saint Judes')
    #     end
        

    # end


end
