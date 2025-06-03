Agency.destroy_all
Agency.create!( name: "Success", city: "Paris" )
Agency.create!( name: "Bella", city: "Milan" )
Agency.create!( name: "Moda", city: "New-York" )

User.destroy_all
User.create!(f_name: "Rogier", l_name: "Bosschaart", username: "rbosschaar", user_type: "agent", email: "rogierbosschaart@gmail.com", password: "1234")

Travel.destroy_all
Travel.create!( origin: "Amsterdam", destination: "Paris", date_time: "03/06/2026 05:32" )
Travel.create!( origin: "Paris", destination: "Milan", date_time: "03/06/2026 23:48" )
Travel.create!( origin: "Milan", destination: "New-YOrk", date_time: "04/06/2026 12:32" )

Hotel.destroy_all
Hotel.create!( name: "Hotel Zeeuws-Meisje", address: "Hoofdpoortstraat 2A, 4301 AM Zierikzee, Netherlands", extra_info: "This cozy boutique hotel is located in the center of Zierikzee" )
Hotel.create!( name: "Pension De Appelgaard", address: "Culemborg, Gelderland, Netherlands", extra_info: "This charming guesthouse offers clean and quiet rooms, a delightful breakfast, and a relaxing atmosphere." )
Hotel.create!( name: "Palau Pacific Resort", address: "Koror, Republic of Palau 96940", extra_info: "A luxurious resort hotel set on 64 acres of tropical forest, offering ideal conditions for a peaceful getaway." )
