require 'rails_helper'

RSpec.describe 'this page shows hospitals' do
    before :each do 
        @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
        @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
        @rose = Hospital.create!(name: 'Rose Medical', public: false, phone: 3045454, location: 'Denver')
        
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

    # it 'displays hospitals by time they were created (most recent first)' do
    #     visit "/hospitals"
    #     binding.pry

    #     expect(index[0]).to eq(@rose)
    # end
end
#   it "returns a published post" do
#     expect(Post.published.count).to be(1)
#     # or inspect to see if it's published, but that's a bit redundant
#   end

#   it "does not return unpublished posts" do
#     expect(Post.published).to_not include(Post.where("status = 0"))
#   end
# RSpec.describe 'this page shows hospitals' do
#     before :each do 
#         @childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora', created_at: "2022-07-07 15:58:46", id:1)
#         @jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver', created_at: "2022-07-08 15:58:46", id:2)
#         @rose = Hospital.create!(name: 'Rose Medical', public: false, phone: 3045454, location: 'Denver', created_at: "2022-07-09 15:58:46", id:3)
#         @hospitals = [@childrerns, @jude, @rose]
#         binding.pry
#     end

#     it 'sorts recent added hospitals first' do

#         expect(@hospitals.first.created_at.id).to be < (@hospitals.first.created_at.id)
#         newest_hospitals = @hospitals.newest
#         assert_operator newest_hospitals.first.created_at, :>=, newest_hospitals.second.created_at
#         assert_operator newest_hospitals.first.created_at, :>=, newest_hospitals.third.created_at
#         assert_operator newest_hospitals.second.created_at, :>=, newest_hospitals.third.created_at
#     end
# end
