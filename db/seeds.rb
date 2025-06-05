Travel.destroy_all
Hotel.destroy_all
Connection.destroy_all
ModelAgencyProfile.destroy_all
Listing.destroy_all
Client.destroy_all
User.destroy_all
Agency.destroy_all

# create agencies
success = Agency.create!( name: "Success", city: "Paris" )
# bella = Agency.create!( name: "Bella", city: "Milan" )
# img = Agency.create!( name: "IMG", city: "New-York" )

# create agents
agent_development = User.create!(f_name: "Kaz", l_name: "Bek", username: "kazbek", user_type: "agent", email: "agent@agent.com", password: "123456", agency: success)
User.create!(f_name: "Test", l_name: "Test", username: "test", user_type: "agent", email: "agent@test.com", password: "123456", agency: success)

# create models
model1 = User.create!(f_name: "Tymur", l_name: "Topchu", username: 'tymur', user_type: 'mannequin', email: "model@model.com", password: "123456")
model2 = User.create!(f_name: "James", l_name: "Jameson", username: 'JJ', user_type: 'mannequin', email: "model@test.com", password: "123456")

# create model_agency_profiles
model_development = ModelAgencyProfile.create!(user: model1, agency: success, active: true)
ModelAgencyProfile.create!(user: model2, agency: success, active: true)

# create travels
Travel.create!( origin: "Amsterdam", destination: "Paris", date: "03/06/2026", time: "11:00", model_agency_profile: model_development, agency: success )
Travel.create!( origin: "Paris", destination: "Milan", date: "03/06/2026", time: "23:48", model_agency_profile: model_development, agency: success )
Travel.create!( origin: "Milan", destination: "New-York", date: "04/06/2026", time: "15:55", model_agency_profile: model_development, agency: success )

# create hotels
Hotel.create!( name: "Hotel Zeeuws-Meisje", address: "Hoofdpoortstraat 2A, 4301 AM Zierikzee, Netherlands", extra_info: "This cozy boutique hotel is located in the center of Zierikzee", model_agency_profile: model_development, agency: success )
Hotel.create!( name: "Pension De Appelgaard", address: "Culemborg, Gelderland, Netherlands", extra_info: "This charming guesthouse offers clean and quiet rooms, a delightful breakfast, and a relaxing atmosphere." , model_agency_profile: model_development, agency: success )
Hotel.create!( name: "Palau Pacific Resort", address: "Koror, Republic of Palau 96940", extra_info: "A luxurious resort hotel set on 64 acres of tropical forest, offering ideal conditions for a peaceful getaway.", model_agency_profile: model_development, agency: success )

# create clients
prada         = Client.create!(name: "Prada", contact_info: "Dave: +33 566738478")
lemaire       = Client.create!(name: "Lemaire", contact_info: "Christophe: +33 566738478")
wooyungmi     = Client.create!(name: "Wooyungmi", contact_info: "John: +33 566738478")
chanel        = Client.create!(name: "Chanel", contact_info: "Sophie: +33 123456789")
dior          = Client.create!(name: "Dior", contact_info: "Marc: +33 987654321")
louis_vuitton = Client.create!(name: "Louis Vuitton", contact_info: "Chloé: +33 654321098")
gucci         = Client.create!(name: "Gucci", contact_info: "Alessandro: +33 789012345")
hermes        = Client.create!(name: "Hermès", contact_info: "Isabelle: +33 234567890")
saint_laurent = Client.create!(name: "Saint Laurent", contact_info: "Pierre: +33 876543210")
balenciage    = Client.create!(name: "Balenciaga", contact_info: "Anna: +33 345678901")
versace       = Client.create!(name: "Versace", contact_info: "Donatella: +33 901234567")
fendi         = Client.create!(name: "Fendi", contact_info: "Silvia: +33 456789012")
burberry      = Client.create!(name: "Burberry", contact_info: "Thomas: +33 567890123")

# create listings
prada_casting         = Listing.create!(client: prada,         user: agent_development, listing_type: 'casting', start_date: "03/06/2026", start_time: "09:00", end_time: "10:00", address: "Paris")
lemaire_job           = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'job',     start_date: "05/06/2026", end_date: "05/06/2026", address: "Milan")
wooyungmi_option      = Listing.create!(client: wooyungmi,     user: agent_development, listing_type: 'option',  start_date: "07/06/2026", end_date: "07/06/2026", address: "New York")
chanel_casting        = Listing.create!(client: chanel,        user: agent_development, listing_type: 'casting', start_date: "08/06/2026", start_time: "09:00", end_time: "11:00", address: "Paris")
dior_job              = Listing.create!(client: dior,          user: agent_development, listing_type: 'job',     start_date: "10/06/2026", end_date: "10/06/2026", address: "Milan")
louis_vuitton_option  = Listing.create!(client: louis_vuitton, user: agent_development, listing_type: 'option',  start_date: "12/06/2026", end_date: "12/06/2026", address: "New York")
gucci_casting         = Listing.create!(client: gucci,         user: agent_development, listing_type: 'casting', start_date: "13/06/2026", start_time: "09:00", end_time: "11:00", address: "Paris")
hermes_job            = Listing.create!(client: hermes,        user: agent_development, listing_type: 'job',     start_date: "14/06/2026", end_date: "14/06/2026", address: "Milan")
saint_laurent_option  = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'option',  start_date: "15/06/2026", end_date: "15/06/2026", address: "New York")
balenciage_casting    = Listing.create!(client: balenciage,    user: agent_development, listing_type: 'casting', start_date: "16/06/2026", start_time: "09:00", end_time: "11:00", address: "Paris")
versace_job           = Listing.create!(client: versace,       user: agent_development, listing_type: 'job',     start_date: "17/06/2026", end_date: "17/06/2026", address: "Milan")
fendi_option          = Listing.create!(client: fendi,         user: agent_development, listing_type: 'option',  start_date: "18/06/2026", end_date: "18/06/2026", address: "New York")
burberry_casting      = Listing.create!(client: burberry,      user: agent_development, listing_type: 'casting', start_date: "19/06/2026", start_time: "09:00", end_time: "12:00", address: "Paris")
prada_job             = Listing.create!(client: prada,         user: agent_development, listing_type: 'job',     start_date: "20/06/2026", end_date: "20/06/2026", address: "Milan")
gucci_option          = Listing.create!(client: gucci,         user: agent_development, listing_type: 'option',  start_date: "21/06/2026", end_date: "21/06/2026", address: "New York")
lemaire_casting       = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'casting', start_date: "22/06/2026", start_time: "09:00", end_time: "22:00", address: "Paris")
chanel_job            = Listing.create!(client: chanel,        user: agent_development, listing_type: 'job',     start_date: "23/06/2026", end_date: "23/06/2026", address: "Milan")
dior_option           = Listing.create!(client: dior,          user: agent_development, listing_type: 'option',  start_date: "24/06/2026", end_date: "24/06/2026", address: "New York")
saint_laurent_casting = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'casting', start_date: "25/06/2026", start_time: "09:00", end_time: "17:00", address: "Paris")
fendi_job             = Listing.create!(client: fendi,         user: agent_development, listing_type: 'job',     start_date: "26/06/2026", end_date: "26/06/2026", address: "Milan")

Connection.create!(model_agency_profile: model_development, listing: prada_casting, rate: 1200)
Connection.create!(model_agency_profile: model_development, listing: lemaire_job, rate: 1400)
Connection.create!(model_agency_profile: model_development, listing: wooyungmi_option, rate: 1000)
Connection.create!(model_agency_profile: model_development, listing: chanel_casting, rate: 1300)
Connection.create!(model_agency_profile: model_development, listing: dior_job, rate: 1500)
Connection.create!(model_agency_profile: model_development, listing: louis_vuitton_option, rate: 1100)
Connection.create!(model_agency_profile: model_development, listing: gucci_casting, rate: 1200)
Connection.create!(model_agency_profile: model_development, listing: hermes_job, rate: 1450)
Connection.create!(model_agency_profile: model_development, listing: saint_laurent_option, rate: 1350)
Connection.create!(model_agency_profile: model_development, listing: balenciage_casting, rate: 1250)
Connection.create!(model_agency_profile: model_development, listing: versace_job, rate: 1600)
Connection.create!(model_agency_profile: model_development, listing: fendi_option, rate: 1150)
Connection.create!(model_agency_profile: model_development, listing: burberry_casting, rate: 1275)
Connection.create!(model_agency_profile: model_development, listing: prada_job, rate: 1550)
Connection.create!(model_agency_profile: model_development, listing: gucci_option, rate: 1050)
Connection.create!(model_agency_profile: model_development, listing: lemaire_casting, rate: 1300)
Connection.create!(model_agency_profile: model_development, listing: chanel_job, rate: 1450)
Connection.create!(model_agency_profile: model_development, listing: dior_option, rate: 1200)
Connection.create!(model_agency_profile: model_development, listing: saint_laurent_casting, rate: 1250)
Connection.create!(model_agency_profile: model_development, listing: fendi_job, rate: 1400)
Connection.create!(model_agency_profile: model_development, listing: prada_casting, rate: 1250)
Connection.create!(model_agency_profile: model_development, listing: hermes_job, rate: 1380)
Connection.create!(model_agency_profile: model_development, listing: louis_vuitton_option, rate: 1080)
Connection.create!(model_agency_profile: model_development, listing: balenciage_casting, rate: 1120)
Connection.create!(model_agency_profile: model_development, listing: lemaire_job, rate: 1490)
Connection.create!(model_agency_profile: model_development, listing: chanel_casting, rate: 1260)
Connection.create!(model_agency_profile: model_development, listing: burberry_casting, rate: 1320)
Connection.create!(model_agency_profile: model_development, listing: saint_laurent_option, rate: 1130)
Connection.create!(model_agency_profile: model_development, listing: gucci_option, rate: 1040)
Connection.create!(model_agency_profile: model_development, listing: fendi_option, rate: 1090)
