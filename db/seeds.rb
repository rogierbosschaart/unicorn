Travel.destroy_all
Hotel.destroy_all

Client.destroy_all
Listing.destroy_all
Connection.destroy_all

User.destroy_all
Agency.destroy_all


success = Agency.create!( name: "Success", city: "Paris" )
bella = Agency.create!( name: "Bella", city: "Milan" )
img = Agency.create!( name: "IMG", city: "New-York" )
agent = User.create!(f_name: "Rogier", l_name: "Bosschaart", username: "rbosschaart", user_type: "agent", email: "rogierbosschaart@gmail.com", password: "123456", agency_id: Agency.last)
model = User.create!(f_name: "Tymur", l_name: "Topchu", username: 'tymur', user_type: 'mannequin', email: "tymur@gmail.com", password: "123456")

Travel.create!( origin: "Amsterdam", destination: "Paris", date_time: "03/06/2026 05:32", user: User.mannequins.last, agency: Agency.first )
Travel.create!( origin: "Paris", destination: "Milan", date_time: "03/06/2026 23:48", user: User.mannequins.last, agency: Agency.last )
Travel.create!( origin: "Milan", destination: "New-York", date_time: "04/06/2026 12:32", user: User.mannequins.last, agency: Agency.last )

Hotel.create!( name: "Hotel Zeeuws-Meisje", address: "Hoofdpoortstraat 2A, 4301 AM Zierikzee, Netherlands", extra_info: "This cozy boutique hotel is located in the center of Zierikzee", user: User.last, agency: Agency.last )
Hotel.create!( name: "Pension De Appelgaard", address: "Culemborg, Gelderland, Netherlands", extra_info: "This charming guesthouse offers clean and quiet rooms, a delightful breakfast, and a relaxing atmosphere." , user: User.last, agency: Agency.last)
Hotel.create!( name: "Palau Pacific Resort", address: "Koror, Republic of Palau 96940", extra_info: "A luxurious resort hotel set on 64 acres of tropical forest, offering ideal conditions for a peaceful getaway.", user: User.last, agency: Agency.last )

Client.create!(name: "Prada", contact_info: "Dave: +33 566738478")
Client.create!(name: "Lemaire", contact_info: "Christophe: +33 566738478")
Client.create!(name: "Wooyungmi", contact_info: "John: +33 566738478")
