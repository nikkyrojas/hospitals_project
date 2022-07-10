# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Hospital.destroy_all

@childrens = Hospital.create!(name: 'Childrens Hospital', public: true, phone: 6213333, location: 'Aurora')
@dr_seuss = @childrens.doctors.create!(name: 'Theodore Seuss', probono: true, specialty: 'Pediatrics', license: 234124, hospital_id:1, created_at: "2022-06-09 15:58:46")
@dr_house = @childrens.doctors.create(name: 'Gregory House', probono: false, specialty: 'Diagnostic Medicine', license: 543466,  hospital_id:1, created_at: "2022-06-30 15:58:46")
@jude = Hospital.create!(name: 'Saint Judes', public: false, phone: 3092332, location: 'Denver')
@dr_grey = @jude.doctors.create(name: 'Meredith Grey', probono: true, specialty: 'General Surgery', license: 346432,  hospital_id:2)
@rose = Hospital.create!(name: 'Rose Medical', public: false, phone: 3045454, location: 'Denver', created_at: "2022-07-09 15:58:46")
@dr_shepperd = @rose.doctors.create(name: 'Derek Sheppard', probono: false, specialty: 'Neurology', license: 154392,  hospital_id:3)
#rails db:seed