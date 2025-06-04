Travel.destroy_all
Hotel.destroy_all
Listing.destroy_all
Client.destroy_all
Connection.destroy_all
User.destroy_all
Agency.destroy_all

# create agencies
success = Agency.create!( name: "Success", city: "Paris" )
# bella = Agency.create!( name: "Bella", city: "Milan" )
# img = Agency.create!( name: "IMG", city: "New-York" )
# create agents
agent1 = User.create!(f_name: "Kaz", l_name: "Bek", username: "kazbek", user_type: "agent", email: "shokybas@gmail.com", password: "123456", agency: success)
agent2 = User.create!(f_name: "Test", l_name: "Test", username: "test", user_type: "agent", email: "test@gmail.com", password: "123456", agency: success)
# create models and connect them to the agency through ModelAgencyProfile
model1 = User.create!(f_name: "Tymur", l_name: "Topchu", username: 'tymur', user_type: 'mannequin', email: "tymur@gmail.com", password: "123456")
model2 = User.create!(f_name: "James", l_name: "Jameson", username: 'JJ', user_type: 'mannequin', email: "james@james.com", password: "123456")
# model3 = User.create!(f_name: "Sarah", l_name: "Sarahson", username: 'SS', user_type: 'mannequin', email: "sarah@sarah.com", password: "123456")
# model4 = User.create!(f_name: "Bennie", l_name: "Bennieson", username: 'BB', user_type: 'mannequin', email: "bennie@bennie.com", password: "123456")
model_development = ModelAgencyProfile.create!(user: model1, agency: success)
model_test = ModelAgencyProfile.create!(user: model2, agency: success)
# ModelAgencyProfile.create!(user: model3, agency: Agency.last)
# ModelAgencyProfile.create!(user: model4, agency: Agency.last)
# ModelAgencyProfile.create!(user: model1, agency: Agency.first)
# ModelAgencyProfile.create!(user: model2, agency: Agency.first)
# ModelAgencyProfile.create!(user: model3, agency: Agency.first)
# ModelAgencyProfile.create!(user: model4, agency: Agency.first)

# create travels
Travel.create!( origin: "Amsterdam", destination: "Paris", date_time: "03/06/2026 05:32", user: model_development, agency: success )
Travel.create!( origin: "Paris", destination: "Milan", date_time: "03/06/2026 23:48", user: model_development, agency: success )
Travel.create!( origin: "Milan", destination: "New-York", date_time: "04/06/2026 12:32", user: model_development, agency: success )

# create hotels
Hotel.create!( name: "Hotel Zeeuws-Meisje", address: "Hoofdpoortstraat 2A, 4301 AM Zierikzee, Netherlands", extra_info: "This cozy boutique hotel is located in the center of Zierikzee", user: model_development, agency: success )
Hotel.create!( name: "Pension De Appelgaard", address: "Culemborg, Gelderland, Netherlands", extra_info: "This charming guesthouse offers clean and quiet rooms, a delightful breakfast, and a relaxing atmosphere." , user: model_development, agency: success )
Hotel.create!( name: "Palau Pacific Resort", address: "Koror, Republic of Palau 96940", extra_info: "A luxurious resort hotel set on 64 acres of tropical forest, offering ideal conditions for a peaceful getaway.", user: model_development, agency: success )

# create clients
Client.create!(name: "Prada", contact_info: "Dave: +33 566738478")
Client.create!(name: "Lemaire", contact_info: "Christophe: +33 566738478")
Client.create!(name: "Wooyungmi", contact_info: "John: +33 566738478")

Listing.create!(client: Client.last, user: agent, listing_type: 'casting', start_date: "03/06/2026", address: "Paris" )
Connection.create!(user: model_development, listing: Listing.last, rate: 1200)
Connection.create!(user: model_development, listing: Listing.last, rate: 1200)
# Connection.create!(user: model3, listing: Listing.last, rate: 1200)
