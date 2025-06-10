require 'faker'

# Destroy all existing data
Post.destroy_all
Travel.destroy_all
Hotel.destroy_all
Connection.destroy_all
ModelAgencyProfile.destroy_all
Listing.destroy_all
Client.destroy_all
User.destroy_all
Agency.destroy_all

puts "--- Destroyed all existing data. ---"

# Create agencies
success = Agency.create!( name: "Success", city: "Paris" )
bella = Agency.create!( name: "Bella", city: "Milan" )
img = Agency.create!( name: "IMG", city: "New-York" )
elite = Agency.create!( name: "Elite", city: "London" )
ford = Agency.create!( name: "Ford", city: "Los Angeles" )
puts "--- Created agencies. ---"

# Create agents
agent_development = User.create!(f_name: "Kaz", l_name: "Bek", username: "kazbek", user_type: "agent", email: "agent@agent.com", password: "123456", agency: success)
User.create!(f_name: "Test", l_name: "Test", username: "test", user_type: "agent", email: "agent@test.com", password: "123456", agency: success)
User.create!(f_name: "Anna", l_name: "Lee", username: "annab", user_type: "agent", email: "anna@bella.com", password: "123456", agency: bella)
User.create!(f_name: "Mark", l_name: "Smith", username: "marks", user_type: "agent", email: "mark@img.com", password: "123456", agency: img)
User.create!(f_name: "Laura", l_name: "Jones", username: "lauraj", user_type: "agent", email: "laura@elite.com", password: "123456", agency: elite)
puts "--- Created agents. ---"

# Create models
models = []
# Preserve original models
models << User.create!(f_name: "Tymur", l_name: "Topchu", username: 'tymur', user_type: 'mannequin', email: "model@model.com", password: "123456")
models << User.create!(f_name: "James", l_name: "Jameson", username: 'JJ', user_type: 'mannequin', email: "model@test.com", password: "123456")

# Add 28 new models to reach a total of 30
(1..28).each do |i|
  models << User.create!(
    f_name: Faker::Name.male_first_name, # or female_first_name or just first_name
    l_name: Faker::Name.last_name,
    username: Faker::Internet.unique.username(specifier: 8),
    user_type: 'mannequin',
    email: "model#{i}@example.com",
    password: "123456"
  )
end
puts "--- Created #{models.count} models. ---"

# Create model_agency_profiles
all_agencies = [success, bella, img, elite, ford]
model_agency_profiles = []

# Ensure 'Success' agency has at least 30 models on their board
models.each do |model|
  model_agency_profiles << ModelAgencyProfile.create!(user: model, agency: success, active: true)
end

# Assign most models to multiple agencies
models.each_with_index do |model, index|
  # For the first 25 models, assign them to 1-2 other random agencies
  if index < 25 # This ensures 'most' of them have multiple profiles
    num_other_agencies = rand(1..2) # Assign to 1 or 2 other agencies
    other_agencies = (all_agencies - [success]).sample(num_other_agencies)
    other_agencies.each do |agency|
      # Avoid creating duplicate profiles if model is already assigned to this agency
      unless ModelAgencyProfile.exists?(user: model, agency: agency)
        model_agency_profiles << ModelAgencyProfile.create!(user: model, agency: agency, active: true)
      end
    end
  end
end
puts "--- Created #{model_agency_profiles.count} model agency profiles. ---"


# Create travels and hotels (max 1 per model_agency_profile per agency)
model_agency_profiles.each do |profile|
  # Hotels
  Hotel.create!(
    name: Faker::Company.name + " Lodge",
    address: Faker::Address.full_address,
    extra_info: Faker::Lorem.sentence(word_count: 12),
    model_agency_profile: profile,
    agency: profile.agency
  )

  # Travels
  Travel.create!(
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    date: Faker::Date.between(from: Date.today + 1.year, to: Date.today + 2.years), # Future dates
    time: Faker::Time.between(from: DateTime.now.beginning_of_day, to: DateTime.now.end_of_day).strftime("%H:%M"),
    model_agency_profile: profile,
    agency: profile.agency
  )
end
puts "--- Created hotels and travels for each model agency profile. ---"


# Create clients
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
puts "--- Created clients. ---"

# Helper to generate future dates for listings
def future_date_for_listing
  Faker::Date.between(from: Date.today + 3.months, to: Date.today + 9.months)
end

# Create listings with future dates
# Casting Listings (Mixed Cities)
prada_casting         = Listing.create!(client: prada,         user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "72 Greene St, New York, NY 10012", location: "SoHo Casting Studio", extra_info: "Bring comp cards and portfolio.")
chanel_casting        = Listing.create!(client: chanel,        user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "11:00", address: "Via Monte Napoleone 8, 20121 Milano")
gucci_casting         = Listing.create!(client: gucci,         user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "11:00", address: "16 Avenue Montaigne, 75008 Paris", extra_info: "Client prefers natural look. Prepare for multiple takes.")
balenciage_casting    = Listing.create!(client: balenciage,    user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "11:00", address: "Via Condotti 61, 00187 Roma", location: "Roman Casting Studio")
burberry_casting      = Listing.create!(client: burberry,      user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "12:00", address: "555 Fifth Ave, New York, NY 10111", extra_info: "Dress code: smart casual. Arrive 15 mins early.")
lemaire_casting       = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "22:00", address: "Corso Giacomo Matteotti 10, 20121 Milano", location: "Milan Exhibition Hall")
saint_laurent_casting = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'casting', start_date: future_date_for_listing, start_time: "09:00", end_time: "17:00", address: "10 Avenue George V, 75008 Paris", extra_info: "Bring own refreshments. No prior experience needed.")

# Option Listings (Mixed Cities)
wooyungmi_option      = Listing.create!(client: wooyungmi,     user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "137 Greene St, New York, NY 10012", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Flatiron Lofts")
louis_vuitton_option  = Listing.create!(client: louis_vuitton, user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "24 Rue de Sèvres, 75006 Paris", extra_info: "Approval required for final booking. Client feedback by EOD.")
saint_laurent_option  = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "Via della Spiga 12, 20121 Milano", location: "Quadrilatero della Moda")
fendi_option          = Listing.create!(client: fendi,         user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "680 5th Ave, New York, NY 10019", photographer: "Micha Taylor", extra_info: "Client confirms within 24h. Hold valid until end of day.")
gucci_option          = Listing.create!(client: gucci,         user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "8 Rue de la Paix, 75002 Paris")
dior_option           = Listing.create!(client: dior,          user: agent_development, listing_type: 'option',  start_date: future_date_for_listing, end_date: future_date_for_listing, address: "Via del Corso 12, 00186 Roma", stylist: "Ferdi Sibbel", location: "Trastevere Studio")

# Job Listings (Mixed Cities)
lemaire_job           = Listing.create!(client: lemaire,       user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, end_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "45 Rockefeller Plaza, New York, NY 10111", photographer: "Micha Taylor", location: "Manhattan Penthouse", extra_info: "Full day shoot, lunch provided.")
dior_job              = Listing.create!(client: dior,          user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "32 Rue François 1er, 75008 Paris", stylist: "Ferdi Sibbel", extra_info: "Early call time requested. Specific wardrobe details to follow.")
hermes_job            = Listing.create!(client: hermes,        user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, end_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "Via Borgonuovo 11, 20121 Milano")
versace_job           = Listing.create!(client: versace,       user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "Via del Babuino 100, 00187 Roma", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Spanish Steps Venue")
prada_job             = Listing.create!(client: prada,         user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "99 Spring St, New York, NY 10012", extra_info: "Catering will be provided. Please inform us of any allergies.")
chanel_job            = Listing.create!(client: chanel,        user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "18 Rue Saint-Honoré, 75001 Paris", stylist: "Ferdi Sibbel", location: "Concorde Square Studio")
fendi_job             = Listing.create!(client: fendi,         user: agent_development, listing_type: 'job',     start_date: future_date_for_listing, end_date: future_date_for_listing, start_time: "09:00", end_time: "10:00", address: "Via della Moscova 24, 20121 Milano", location: "Brera District", extra_info: "Travel details will be confirmed next week.")
puts "--- Created listings. ---"

# Store listings by type for easy access
all_castings = Listing.where(listing_type: 'casting').to_a
all_options  = Listing.where(listing_type: 'option').to_a
all_jobs     = Listing.where(listing_type: 'job').to_a
all_listings = Listing.all.to_a


# Create connections

# 1. Distribute connections for model1 (Tymur) across all its agency profiles
tymur_profiles = ModelAgencyProfile.where(user: models[0]) # models[0] is Tymur

tymur_profiles.each do |profile|
  puts "Creating connections for Tymur's profile with #{profile.agency.name} agency..."

  # Ensure each profile gets at least 1 casting, 1 option, and 1 job
  listings_to_assign = []
  listings_to_assign << all_castings.sample
  listings_to_assign << all_options.sample
  listings_to_assign << all_jobs.sample

  # Add a few more random listings for variety (2-5 extra connections)
  rand(2..5).times do
    listings_to_assign << all_listings.sample
  end

  # Create connections for this profile, avoiding duplicates
  listings_to_assign.uniq.each do |listing|
    unless Connection.exists?(model_agency_profile: profile, listing: listing)
      Connection.create!(
        model_agency_profile: profile,
        agency_id: profile.agency.id, # Ensure agency_id matches the profile's agency
        listing: listing,
        rate: rand(800..2500),
        opened: [true, false].sample
      )
    end
  end
end

# 2. Add connections for other models (primarily through their 'success' agency profile)
# This uses the original logic for other models, ensuring a good spread for them too
model_agency_profiles.select { |map| map.agency == success && map.user != models[0] }.each do |map_success|
  rand(1..5).times do # Each of these models gets 1 to 5 random connections
    listing = all_listings.sample
    unless Connection.exists?(model_agency_profile: map_success, listing: listing)
      Connection.create!(
        model_agency_profile: map_success,
        agency_id: success.id,
        listing: listing,
        rate: rand(800..2500),
        opened: [true, false].sample
      )
    end
  end
end

puts "--- Created connections. ---"

puts "--- Seed file executed successfully! ---"
