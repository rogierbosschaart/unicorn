Post.destroy_all
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
bella = Agency.create!( name: "Bella", city: "Milan" )
img = Agency.create!( name: "IMG", city: "New-York" )

# create agents
agent_development = User.create!(f_name: "Kaz", l_name: "Bek", username: "kazbek", user_type: "agent", email: "agent@agent.com", password: "123456", agency: success)
User.create!(f_name: "Test", l_name: "Test", username: "test", user_type: "agent", email: "agent@test.com", password: "123456", agency: success)

# create models
model1 = User.create!(f_name: "Tymur", l_name: "Topchu", username: 'tymur', user_type: 'mannequin', email: "model@model.com", password: "123456")
model2 = User.create!(f_name: "James", l_name: "Jameson", username: 'JJ', user_type: 'mannequin', email: "model@test.com", password: "123456")

# create model_agency_profiles
model_development = ModelAgencyProfile.create!(user: model1, agency: success, active: true)
ModelAgencyProfile.create!(user: model2, agency: success, active: true)
ModelAgencyProfile.create!(user: model3, agency: bella, active: true)
ModelAgencyProfile.create!(user: model4, agency: bella, active: true)
ModelAgencyProfile.create!(user: model5, agency: img, active: true)
ModelAgencyProfile.create!(user: model6, agency: img, active: true)


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
# Casting Listings (Mixed Cities)
prada_casting         = Listing.create!(client: prada,         user: agent_development, listing_type: 'casting', start_date: "03/06/2026", start_time: "09:00", end_time: "10:00", address: "72 Greene St, New York, NY 10012", location: "SoHo Casting Studio", extra_info: "Bring comp cards and portfolio.")
chanel_casting        = Listing.create!(client: chanel,        user: agent_development, listing_type: 'casting', start_date: "08/06/2026", start_time: "09:00", end_time: "11:00", address: "Via Monte Napoleone 8, 20121 Milano")
gucci_casting         = Listing.create!(client: gucci,         user: agent_development, listing_type: 'casting', start_date: "13/06/2026", start_time: "09:00", end_time: "11:00", address: "16 Avenue Montaigne, 75008 Paris", extra_info: "Client prefers natural look. Prepare for multiple takes.")
balenciage_casting    = Listing.create!(client: balenciage,    user: agent_development, listing_type: 'casting', start_date: "16/06/2026", start_time: "09:00", end_time: "11:00", address: "Via Condotti 61, 00187 Roma", location: "Roman Casting Studio")
burberry_casting      = Listing.create!(client: burberry,      user: agent_development, listing_type: 'casting', start_date: "19/06/2026", start_time: "09:00", end_time: "12:00", address: "555 Fifth Ave, New York, NY 10111", extra_info: "Dress code: smart casual. Arrive 15 mins early.")
lemaire_casting       = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'casting', start_date: "22/06/2026", start_time: "09:00", end_time: "22:00", address: "Corso Giacomo Matteotti 10, 20121 Milano", location: "Milan Exhibition Hall")
saint_laurent_casting = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'casting', start_date: "25/06/2026", start_time: "09:00", end_time: "17:00", address: "10 Avenue George V, 75008 Paris", extra_info: "Bring own refreshments. No prior experience needed.")

# Option Listings (Mixed Cities)
wooyungmi_option      = Listing.create!(client: wooyungmi,     user: agent_development, listing_type: 'option',  start_date: "07/06/2026", end_date: "07/06/2026", address: "137 Greene St, New York, NY 10012", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Flatiron Lofts")
louis_vuitton_option  = Listing.create!(client: louis_vuitton, user: agent_development, listing_type: 'option',  start_date: "12/06/2026", end_date: "12/06/2026", address: "24 Rue de Sèvres, 75006 Paris", extra_info: "Approval required for final booking. Client feedback by EOD.")
saint_laurent_option  = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'option',  start_date: "15/06/2026", end_date: "15/06/2026", address: "Via della Spiga 12, 20121 Milano", location: "Quadrilatero della Moda")
fendi_option          = Listing.create!(client: fendi,         user: agent_development, listing_type: 'option',  start_date: "18/06/2026", end_date: "18/06/2026", address: "680 5th Ave, New York, NY 10019", photographer: "Micha Taylor", extra_info: "Client confirms within 24h. Hold valid until end of day.")
gucci_option          = Listing.create!(client: gucci,         user: agent_development, listing_type: 'option',  start_date: "21/06/2026", end_date: "21/06/2026", address: "8 Rue de la Paix, 75002 Paris")
dior_option           = Listing.create!(client: dior,          user: agent_development, listing_type: 'option',  start_date: "24/06/2026", end_date: "24/06/2026", address: "Via del Corso 12, 00186 Roma", stylist: "Ferdi Sibbel", location: "Trastevere Studio")

# Job Listings (Mixed Cities)
lemaire_job           = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'job',     start_date: "05/06/2026", end_date: "05/06/2026", start_time: "09:00", end_time: "10:00", address: "45 Rockefeller Plaza, New York, NY 10111", photographer: "Micha Taylor", location: "Manhattan Penthouse", extra_info: "Full day shoot, lunch provided.")
dior_job              = Listing.create!(client: dior,          user: agent_development, listing_type: 'job',     start_date: "10/06/2026", start_time: "09:00", end_time: "10:00", address: "32 Rue François 1er, 75008 Paris", stylist: "Ferdi Sibbel", extra_info: "Early call time requested. Specific wardrobe details to follow.")
hermes_job            = Listing.create!(client: hermes,        user: agent_development, listing_type: 'job',     start_date: "14/06/2026", end_date: "14/06/2026", start_time: "09:00", end_time: "10:00", address: "Via Borgonuovo 11, 20121 Milano")
versace_job           = Listing.create!(client: versace,       user: agent_development, listing_type: 'job',     start_date: "17/06/2026", start_time: "09:00", end_time: "10:00", address: "Via del Babuino 100, 00187 Roma", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Spanish Steps Venue")
prada_job             = Listing.create!(client: prada,         user: agent_development, listing_type: 'job',     start_date: "20/06/2026", start_time: "09:00", end_time: "10:00", address: "99 Spring St, New York, NY 10012", extra_info: "Catering will be provided. Please inform us of any allergies.")
chanel_job            = Listing.create!(client: chanel,        user: agent_development, listing_type: 'job',     start_date: "23/06/2026", start_time: "09:00", end_time: "10:00", address: "18 Rue Saint-Honoré, 75001 Paris", stylist: "Ferdi Sibbel", location: "Concorde Square Studio")
fendi_job             = Listing.create!(client: fendi,         user: agent_development, listing_type: 'job',     start_date: "26/06/2026", end_date: "26/06/2026", start_time: "09:00", end_time: "10:00", address: "Via della Moscova 24, 20121 Milano", location: "Brera District", extra_info: "Travel details will be confirmed next week.")

Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: prada_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: lemaire_job, rate: 1400)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: wooyungmi_option)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: chanel_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: dior_job, rate: 1500)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: louis_vuitton_option)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: gucci_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: hermes_job, rate: 1450)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: saint_laurent_option, rate: 1350)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: balenciage_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: versace_job, rate: 1600)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: fendi_option, rate: 1150)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: burberry_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: prada_job, rate: 1550)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: gucci_option, rate: 1050)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: lemaire_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: chanel_job, rate: 1450)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: dior_option, rate: 1200)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: saint_laurent_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: fendi_job, rate: 1400)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: prada_casting, rate: 1250)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: hermes_job, rate: 1380)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: louis_vuitton_option, rate: 1080)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: balenciage_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: lemaire_job, rate: 1490)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: chanel_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: burberry_casting)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: saint_laurent_option)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: gucci_option, rate: 1040)
Connection.create!(model_agency_profile: model_development, agency_id: success.id, listing: fendi_option)
