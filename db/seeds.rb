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
success = Agency.create!( name: "Success", city: "Paris", profile_pic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%2Fid%2FOIP.KFul4HYDZMXY29mMQcG2eAAAAA%3Fpid%3DApi&f=1&ipt=2965f9e8ca5b6b6cd39c10f9d5465ad61409215eb337152616098e4966ee1fef&ipo=images" )
bella = Agency.create!( name: "Elite", city: "Milan", profile_pic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.mdel.net%2Fi%2Fdb%2Flogos%2Fag%2F399.jpg%3Fv%3D1719583220000&f=1&nofb=1&ipt=4d9bf04c8f28a5b5e815171ee0d9487b8ea9c45576036ce3d118295447ebddaf")
img = Agency.create!( name: "IMG", city: "New-York", profile_pic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fa7%2F91%2F6a%2Fa7916a76d838a86a0bc97d0aa0643692.jpg&f=1&nofb=1&ipt=ee857f50197a02c790309075b6deec598b4b6f90a05aebfc9da5abcbfc579062")

# create agents
agent_development = User.create!(f_name: "Kaz", l_name: "Bek", username: "kazbek", user_type: "agent", email: "agent@agent.com", password: "123456", agency: success)
agent2 = User.create!(f_name: "Rogier", l_name: "Bosschaart", username: "rogier", user_type: "agent", email: "agent@test.com", password: "123456", agency: bella)
agent3 = User.create!(f_name: "Tymur", l_name: "Topchu", username: "tymur", user_type: "agent", email: "tymur@test.com", password: "123456", agency: img)

# create models
model1 = User.create!(f_name: "Rogier", l_name: "Bosschaart", username: 'rogier', user_type: 'mannequin', email: "model@model.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/1300/1302/large-1538734850-5a8d3b324b3a9b0c1bc3d65d50daa89e.jpg")
model2 = User.create!(f_name: "Luca", l_name: "Moretti", username: 'lucam', user_type: 'mannequin', email: "luca@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3219/11321/profile-1732010945-bb86b6d15c4a22519d7c11fe3b0ccc7a.jpg")
model3 = User.create!(f_name: "Donald", l_name: "Keller", username: 'dok', user_type: 'mannequin', email: "donald@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3434/12943/profile-1713795000-1ceab4c617d7c03fb2e89d21e71bca72.jpg")
model4 = User.create!(f_name: "Jonas", l_name: "Schmidt", username: 'jonass', user_type: 'mannequin', email: "jonas@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2681/5597/profile-1489595075-e5978d92642f450e9addee426d2a1d25.jpg")
model5 = User.create!(f_name: "Musa", l_name: "Dupont", username: 'musad', user_type: 'mannequin', email: "musa@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3270/11762/profile-1743600459-77e5ab51d7bb747ced07302d61221fcb.jpg")
model6 = User.create!(f_name: "Mateo", l_name: "Rossi", username: 'mateor', user_type: 'mannequin', email: "mateo@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2552/3896/profile-1727861883-a080992ead30fd82a810cacb233e46c2.jpg?v=1728462856")
model7 = User.create!(f_name: "Nico", l_name: "Hernandez", username: 'nicoh', user_type: 'mannequin', email: "nico@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3703/14793/profile-1749030560-4ec9574e74438bfd66c2cb4a4677d856.jpg")
model8 = User.create!(f_name: "Alex", l_name: "Tanaka", username: 'alext', user_type: 'mannequin', email: "alex@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2933/8267/profile-1725357622-6c5a914fcb6848b6383f053d783cabf6.jpg")
model9 = User.create!(f_name: "Max", l_name: "Lemoine", username: 'maxl', user_type: 'mannequin', email: "max@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3234/11422/profile-1686559206-d481e01e297b50d3602f5846f05961e6.jpg")
model10 = User.create!(f_name: "Felix", l_name: "Nguyen", username: 'felixn', user_type: 'mannequin', email: "felix@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3479/13152/profile-1716372303-7d23dd1c6b5855e6d66dab31b504c74a.jpg")
model11 = User.create!(f_name: "Nino", l_name: "Kowalski", username: 'ninok', user_type: 'mannequin', email: "nino@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2911/8158/profile-1658935619-0129d051f102b8c1a4a9c3b4d316c619.jpg")
model12 = User.create!(f_name: "Leo", l_name: "Petrov", username: 'leop', user_type: 'mannequin', email: "leo@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2712/5875/profile-1644488270-62241038b29a78a2d26aee583bee7e9e.jpg?v=1644488523")
model13 = User.create!(f_name: "Johannes", l_name: "Abe", username: 'johannesabe', user_type: 'mannequin', email: "jahannes@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/340/342/profile-1743431008-1f50f50d4348170095351c8b613bc94a.jpg")
model14 = User.create!(f_name: "Marek", l_name: "Nowak", username: 'marekn', user_type: 'mannequin', email: "marek@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2602/5265/profile-1544714563-39462e82799087be0b762faf1e792c5f.jpg")
model15 = User.create!(f_name: "Zorro", l_name: "Mendes", username: 'zorrom', user_type: 'mannequin', email: "zorro@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3338/12152/profile-1725360570-60aedfbae59312782c64a90182960777.jpg?v=1725376123")
model16 = User.create!(f_name: "Victor", l_name: "Crue", username: 'vcrue', user_type: 'mannequin', email: "victor@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2409/2411/profile-1701185635-92f1776d32fb3a70e3dfcaaeb55163ad.jpg")
model17 = User.create!(f_name: "Amin", l_name: "Ali", username: 'amina', user_type: 'mannequin', email: "amin@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3054/9337/profile-1647511670-25579670394ec7d393f70d6e2ce8bb09.jpg?v=1647512006")
model18 = User.create!(f_name: "Tom", l_name: "Martens", username: 'tomm', user_type: 'mannequin', email: "tom@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/451/453/profile-1725374973-b8b368f93ea8305d24f939ae53d3495b.jpg")
model19 = User.create!(f_name: "Samuel", l_name: "Jensen", username: 'samuelj', user_type: 'mannequin', email: "samuel@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/33/35/profile-1727792323-6bc29588631e4757cc10d1f163fcedbc.jpg")
model20 = User.create!(f_name: "Liam", l_name: "Thompson", username: 'liamt', user_type: 'mannequin', email: "liam@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/615/617/profile-1474878787-28d7672749cd2add057743216aae88b3.jpg")
model21 = User.create!(f_name: "Anton", l_name: "Popov", username: 'antonp', user_type: 'mannequin', email: "anton@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3515/13433/profile-1716460336-f371ab2396cbe8b5aa4b15ec467492cc.jpg")
model22 = User.create!(f_name: "David", l_name: "Wong", username: 'davidw', user_type: 'mannequin', email: "david@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3113/10034/profile-1711473691-6dea106d72b36cd69ae7f68041f19b33.jpg")
model23 = User.create!(f_name: "Aleks", l_name: "Dubois", username: 'alexd', user_type: 'mannequin', email: "aleks@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2511/2559/profile-1564416512-5c98d365d31cb3049eda1fbc1dc748a2.jpg")
model24 = User.create!(f_name: "Noah", l_name: "Kim", username: 'noahk', user_type: 'mannequin', email: "noah@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2581/4820/profile-1684159758-5e4ebaf2b5f7da8be9353cf7ec41f3db.jpg")
model25 = User.create!(f_name: "Julian", l_name: "Meier", username: 'julianm', user_type: 'mannequin', email: "julian@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3468/13099/profile-1701255973-54e0e11ab2ae6761d0d6c49a85c97a7a.jpg?v=1701257658")
model26 = User.create!(f_name: "Aziz", l_name: "Ivoby", username: 'aivoby', user_type: 'mannequin', email: "aziz@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/2998/8986/profile-1732187259-6fd4674f8369848dc3c0555d0b9513d5.jpg?v=1732187466")
model27 = User.create!(f_name: "Valentino", l_name: "Bianchi", username: 'valentinob', user_type: 'mannequin', email: "valentino@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3299/12709/profile-1742233430-4442e3e587463c9c818e6f364318a400.jpg?v=1742381333")
model28 = User.create!(f_name: "Julien", l_name: "Leroy", username: 'julienl', user_type: 'mannequin', email: "julien@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/396/398/profile-1449833921-4392bec455b6538790e92ae45e616557.jpg")
model29 = User.create!(f_name: "Mehmet", l_name: "Demir", username: 'mehmetd', user_type: 'mannequin', email: "mehmet@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3426/12909/profile-1684838263-c79397b53b9dcf766686ba8be6695ce0.jpg?v=1698311965")
model30 = User.create!(f_name: "Victor", l_name: "Silva", username: 'victors', user_type: 'mannequin', email: "victors@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3423/14466/profile-1731672672-649a7d73ac40c93732f46dc8ae6c1224.jpg")
model31 = User.create!(f_name: "Akiro", l_name: "Hashimoto", username: 'akiroh', user_type: 'mannequin', email: "akiro@test.com", password: "123456", profile_pic: "https://mediaslide-europe.storage.googleapis.com/success/pictures/3282/11831/profile-1637148269-c29d069aa959fb10f580112154d4ae65.jpg")

# create model_agency_profiles
model_success = ModelAgencyProfile.create!(user: model1, agency: success, active: true)
ModelAgencyProfile.create!(user: model2, agency: success, active: true)
model_bella = ModelAgencyProfile.create!(user: model1, agency: bella)
ModelAgencyProfile.create!(user: model2, agency: bella)
model_img = ModelAgencyProfile.create!(user: model1, agency: img)
ModelAgencyProfile.create!(user: model2, agency: img)

profile_3 = ModelAgencyProfile.create!(user: model3, agency: success, selected: true)
profile_4 = ModelAgencyProfile.create!(user: model4, agency: success, selected: true)
profile_5 = ModelAgencyProfile.create!(user: model5, agency: success, selected: true)
profile_6 = ModelAgencyProfile.create!(user: model6, agency: success, selected: true)
profile_7 = ModelAgencyProfile.create!(user: model7, agency: success, selected: true)
profile_8 = ModelAgencyProfile.create!(user: model8, agency: success, selected: true)
profile_9 = ModelAgencyProfile.create!(user: model9, agency: success, selected: true)
profile_10 = ModelAgencyProfile.create!(user: model10, agency: success, selected: true)
profile_11 = ModelAgencyProfile.create!(user: model11, agency: success, selected: true)
profile_12 = ModelAgencyProfile.create!(user: model12, agency: success, selected: true)
profile_13 = ModelAgencyProfile.create!(user: model13, agency: success, selected: true)
profile_14 = ModelAgencyProfile.create!(user: model14, agency: success, selected: true)
profile_15 = ModelAgencyProfile.create!(user: model15, agency: success, selected: true)
profile_16 = ModelAgencyProfile.create!(user: model16, agency: success, selected: true)
profile_17 = ModelAgencyProfile.create!(user: model17, agency: success, selected: true)
profile_18 = ModelAgencyProfile.create!(user: model18, agency: success, selected: true)
profile_19 = ModelAgencyProfile.create!(user: model19, agency: success, selected: true)
profile_20 = ModelAgencyProfile.create!(user: model20, agency: success, selected: true)
profile_21 = ModelAgencyProfile.create!(user: model21, agency: success, selected: true)
profile_22 = ModelAgencyProfile.create!(user: model22, agency: success, selected: true)
profile_23 = ModelAgencyProfile.create!(user: model23, agency: success, selected: true)
profile_24 = ModelAgencyProfile.create!(user: model24, agency: success, selected: true)
profile_25 = ModelAgencyProfile.create!(user: model25, agency: success, selected: true)
profile_26 = ModelAgencyProfile.create!(user: model26, agency: success, selected: true)
profile_27 = ModelAgencyProfile.create!(user: model27, agency: success, selected: true)
profile_28 = ModelAgencyProfile.create!(user: model28, agency: success, selected: true)
profile_29 = ModelAgencyProfile.create!(user: model29, agency: success, selected: true)
profile_30 = ModelAgencyProfile.create!(user: model30, agency: success, selected: true)
profile_31 = ModelAgencyProfile.create!(user: model31, agency: success, selected: true)

# create travels
Travel.create!(origin: "Amsterdam", destination: "Paris", date: "03/06/2026", time: "11:00", model_agency_profile: model_success, agency: success)
Travel.create!(origin: "Paris", destination: "Milan", date: "03/06/2026", time: "23:48", model_agency_profile: model_bella, agency: bella)
Travel.create!(origin: "Milan", destination: "New-York", date: "04/06/2026", time: "15:55", model_agency_profile: model_img, agency: img)

# create hotels
Hotel.create!(
  name: "The Casting Call Inn",
  address: "123 Film Studio Ave, Los Angeles, CA 90210, USA",
  extra_info: "Perfectly located for quick access to major casting studios, offering comfortable stays with early breakfast options.",
  model_agency_profile: model_success,
  agency: success
)
Hotel.create!(
  name: "Runway Retreat Boutique",
  address: "456 Fashion Blvd, Milan, Lombardy, Italy",
  extra_info: "A chic, modern hotel frequented by models and designers, ideal for fashion week or extended job assignments.",
  model_agency_profile: model_bella,
  agency: bella
)

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
prada_casting         = Listing.create!(client: prada,         user: agent3, listing_type: 'casting', start_date: "03/06/2025", start_time: "09:00", end_time: "10:00", address: "72 Greene St, New York, NY 10012", location: "SoHo Casting Studio", extra_info: "Bring comp cards and portfolio.")
chanel_casting        = Listing.create!(client: chanel,        user: agent2, listing_type: 'casting', start_date: "08/06/2025", start_time: "09:00", end_time: "11:00", address: "Via Monte Napoleone 8, 20121 Milano")
gucci_casting         = Listing.create!(client: gucci,         user: agent_development, listing_type: 'casting', start_date: "13/06/2025", start_time: "09:00", end_time: "11:00", address: "16 Avenue Montaigne, 75008 Paris", extra_info: "Client prefers natural look. Prepare for multiple takes.")
balenciage_casting    = Listing.create!(client: balenciage,    user: agent2, listing_type: 'casting', start_date: "16/06/2025", start_time: "09:00", end_time: "11:00", address: "Corso Venezia 16, 20121 Milano", location: "Milano Casting Loft")
burberry_casting      = Listing.create!(client: burberry,      user: agent3, listing_type: 'casting', start_date: "19/06/2025", start_time: "09:00", end_time: "12:00", address: "555 Fifth Ave, New York, NY 10111", extra_info: "Dress code: smart casual. Arrive 15 mins early.")
lemaire_casting       = Listing.create!(client: lemaire,       user: agent2, listing_type: 'casting', start_date: "22/06/2025", start_time: "09:00", end_time: "22:00", address: "Corso Giacomo Matteotti 10, 20121 Milano", location: "Milan Exhibition Hall")
saint_laurent_casting = Listing.create!(client: saint_laurent, user: agent_development, listing_type: 'casting', start_date: "25/06/2025", start_time: "09:00", end_time: "17:00", address: "10 Avenue George V, 75008 Paris", extra_info: "Bring own refreshments. No prior experience needed.")

fendi_casting = Listing.create!(client: fendi, user: agent_development, listing_type: 'casting', start_date: "09/07/2025", start_time: "13:00", end_time: "14:30", address: "12 Rue Saint-Honoré, 75001 Paris", location: "Fendi Concept Room", extra_info: "No visible tattoos or piercings.")
louis_vuitton_casting = Listing.create!(client: louis_vuitton, user: agent_development, listing_type: 'casting', start_date: "10/07/2025", start_time: "15:00", end_time: "17:00", address: "2 Place Vendôme, 75001 Paris", location: "LV Paris HQ", extra_info: "Luxury accessories focus.")
hermes_casting = Listing.create!(client: hermes, user: agent_development, listing_type: 'casting', start_date: "11/07/2025", start_time: "10:30", end_time: "12:00", address: "24 Rue du Faubourg Saint-Honoré, 75008 Paris", location: "Hermès Showroom", extra_info: "Classic elegance look.")
burberry_casting_2 = Listing.create!(client: burberry, user: agent_development, listing_type: 'casting', start_date: "12/07/2025", start_time: "14:00", end_time: "16:00", address: "7 Rue de la Paix, 75002 Paris", location: "Burberry Selection Studio", extra_info: "Smart casual required.")
wooyungmi_casting = Listing.create!(client: wooyungmi, user: agent_development, listing_type: 'casting', start_date: "13/07/2025", start_time: "09:00", end_time: "10:30", address: "13 Boulevard Haussmann, 75009 Paris", location: "Wooyungmi Paris Base", extra_info: "Editorial look expected.")

# Option Listings (Mixed Cities)
wooyungmi_option      = Listing.create!(client: wooyungmi,     user: agent3, listing_type: 'option',  start_date: "07/06/2025", end_date: "07/06/2025", address: "137 Greene St, New York, NY 10012", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Flatiron Lofts")
louis_vuitton_option  = Listing.create!(client: louis_vuitton, user: agent_development, listing_type: 'option',  start_date: "12/06/2025", end_date: "12/06/2025", address: "24 Rue de Sèvres, 75006 Paris", extra_info: "Approval required for final booking. Client feedback by EOD.")
saint_laurent_option  = Listing.create!(client: saint_laurent, user: agent2, listing_type: 'option',  start_date: "15/06/2025", end_date: "15/06/2025", address: "Via della Spiga 12, 20121 Milano", location: "Quadrilatero della Moda")
fendi_option          = Listing.create!(client: fendi,         user: agent3, listing_type: 'option',  start_date: "18/06/2025", end_date: "18/06/2025", address: "680 5th Ave, New York, NY 10019", photographer: "Micha Taylor", extra_info: "Client confirms within 24h. Hold valid until end of day.")
gucci_option          = Listing.create!(client: gucci,         user: agent_development, listing_type: 'option',  start_date: "21/06/2025", end_date: "21/06/2025", address: "8 Rue de la Paix, 75002 Paris")
dior_option           = Listing.create!(client: dior,          user: agent2, listing_type: 'option',  start_date: "24/06/2025", end_date: "24/06/2025", address: "Via Tortona 27, 20144 Milano", stylist: "Ferdi Sibbel", location: "Tortona Fashion Hub")

# Job Listings (Mixed Cities)
lemaire_job           = Listing.create!(client: lemaire,       user: agent3, listing_type: 'job',     start_date: "05/06/2025", end_date: "05/06/2025", start_time: "09:00", end_time: "18:00", address: "45 Rockefeller Plaza, New York, NY 10111", photographer: "Micha Taylor", location: "Manhattan Penthouse", extra_info: "Full day shoot, lunch provided.")
dior_job              = Listing.create!(client: dior,          user: agent_development, listing_type: 'job',     start_date: "10/06/2025", start_time: "09:00", end_time: "10:00", address: "32 Rue François 1er, 75008 Paris", stylist: "Ferdi Sibbel", extra_info: "Early call time requested. Specific wardrobe details to follow.")
hermes_job            = Listing.create!(client: hermes,        user: agent2, listing_type: 'job',     start_date: "14/06/2025", end_date: "14/06/2025", start_time: "09:00", end_time: "10:00", address: "Via Borgonuovo 11, 20121 Milano")
versace_job           = Listing.create!(client: versace,       user: agent2, listing_type: 'job',     start_date: "17/06/2025", start_time: "09:00", end_time: "10:00", address: "Piazza Gae Aulenti 8, 20154 Milano", photographer: "Micha Taylor", stylist: "Ferdi Sibbel", location: "Gae Aulenti Studio")
prada_job             = Listing.create!(client: prada,         user: agent3, listing_type: 'job',     start_date: "20/06/2025", start_time: "09:00", end_time: "17:00", address: "99 Spring St, New York, NY 10012", extra_info: "Catering will be provided. Please inform us of any allergies.")
chanel_job            = Listing.create!(client: chanel,        user: agent_development, listing_type: 'job',     start_date: "23/06/2025", start_time: "09:00", end_time: "10:00", address: "18 Rue Saint-Honoré, 75001 Paris", stylist: "Ferdi Sibbel", location: "Concorde Square Studio")
fendi_job             = Listing.create!(client: fendi,         user: agent2, listing_type: 'job',     start_date: "26/06/2025", end_date: "26/06/2025", start_time: "09:00", end_time: "10:00", address: "Via della Moscova 24, 20121 Milano", location: "Brera District", extra_info: "Travel details will be confirmed next week.")

# create connections
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: prada_casting)
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: lemaire_job, rate: 1400)
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: wooyungmi_option)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: chanel_casting)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: dior_job, rate: 1500)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: louis_vuitton_option)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: gucci_casting)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: hermes_job, rate: 1450)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: saint_laurent_option, rate: 1350)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: balenciage_casting)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: versace_job, rate: 1600)
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: fendi_option, rate: 1150)
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: burberry_casting)
Connection.create!(model_agency_profile: model_img, agency_id: img.id, listing: prada_job, rate: 1550)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: gucci_option, rate: 1050)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: lemaire_casting)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: chanel_job, rate: 1450)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: dior_option, rate: 1200)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: saint_laurent_casting)
Connection.create!(model_agency_profile: model_bella, agency_id: bella.id, listing: fendi_job, rate: 1400)

Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: prada_casting, rate: 1200)
Connection.create!(model_agency_profile: profile_4, agency_id: success.id, listing: chanel_casting, rate: 1450)
Connection.create!(model_agency_profile: profile_5, agency_id: success.id, listing: gucci_casting, rate: 1300)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: balenciage_casting, rate: 1210)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: lemaire_casting, rate: 1275)
Connection.create!(model_agency_profile: profile_8, agency_id: success.id, listing: saint_laurent_casting, rate: 1400)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: burberry_casting, rate: 1330)
Connection.create!(model_agency_profile: profile_10, agency_id: success.id, listing: wooyungmi_casting, rate: 1150)
Connection.create!(model_agency_profile: profile_11, agency_id: success.id, listing: wooyungmi_casting, rate: 1380)
Connection.create!(model_agency_profile: profile_12, agency_id: success.id, listing: wooyungmi_casting, rate: 1280)
Connection.create!(model_agency_profile: profile_13, agency_id: success.id, listing: louis_vuitton_option, rate: 1110)
Connection.create!(model_agency_profile: profile_14, agency_id: success.id, listing: gucci_option, rate: 1250)
Connection.create!(model_agency_profile: profile_15, agency_id: success.id, listing: louis_vuitton_casting, rate: 1500)
Connection.create!(model_agency_profile: profile_16, agency_id: success.id, listing: louis_vuitton_casting, rate: 1590)
Connection.create!(model_agency_profile: profile_17, agency_id: success.id, listing: burberry_casting_2, rate: 1440)
Connection.create!(model_agency_profile: profile_18, agency_id: success.id, listing: burberry_casting_2, rate: 1370)
Connection.create!(model_agency_profile: profile_19, agency_id: success.id, listing: burberry_casting_2, rate: 1410)
Connection.create!(model_agency_profile: profile_20, agency_id: success.id, listing: gucci_option, rate: 1550)
Connection.create!(model_agency_profile: profile_21, agency_id: success.id, listing: fendi_casting, rate: 1200)
Connection.create!(model_agency_profile: profile_22, agency_id: success.id, listing: fendi_casting, rate: 1460)
Connection.create!(model_agency_profile: model_success, agency_id: success.id, listing: burberry_casting, rate: 1350)
Connection.create!(model_agency_profile: profile_24, agency_id: success.id, listing: hermes_casting, rate: 1240)
Connection.create!(model_agency_profile: profile_25, agency_id: success.id, listing: hermes_casting, rate: 1390)
Connection.create!(model_agency_profile: profile_26, agency_id: success.id, listing: hermes_casting, rate: 1175)
Connection.create!(model_agency_profile: profile_27, agency_id: success.id, listing: chanel_job, rate: 1125)
Connection.create!(model_agency_profile: profile_28, agency_id: success.id, listing: chanel_casting, rate: 1340)
Connection.create!(model_agency_profile: profile_29, agency_id: success.id, listing: dior_job, rate: 1530)
Connection.create!(model_agency_profile: profile_30, agency_id: success.id, listing: louis_vuitton_casting, rate: 1190)
Connection.create!(model_agency_profile: profile_31, agency_id: success.id, listing: louis_vuitton_option, rate: 1360)




# create posts
# post = Post.create!(post_text: "Casting in Milan!", user: model1, agency: success)
# post.photo.attach(io: File.open(...), filename: "Milan.jpg", content_type: "image/jpeg")

# post2 = Post.create!(
#   user: model1,
#   agency: success,
#   post_text: "Quick reminder: the casting in Paris is at 10:00 sharp. Don’t forget comp cards and arrive 15 mins early."
# )
# post2.photo.attach(
#   io: File.open(Rails.root.join("db", "seeds", "photos", "Paris.jpg")),
#   filename: "Paris.jpg",
#   content_type: "image/jpeg"
# )

# post3 = Post.create!(
#   user: model1,
#   agency: success,
#   post_text: "New campaign casting happening this weekend. Final list will be shared soon — stay prepared."
# )
# post3.photo.attach(
#   io: File.open(Rails.root.join("db", "seeds", "photos", "casting.jpg")),
#   filename: "casting.jpg",
#   content_type: "image/jpeg"
# )

# post4 = Post.create!(
#   user: model1,
#   agency: success,
#   post_text: "This month’s highlight moments across Europe. Proud to see the hard work paying off."
# )
# post4.photo.attach(
#   io: File.open(Rails.root.join("db", "seeds", "photos", "photoshoot.jpg")),
#   filename: "photoshoot.jpg",
#   content_type: "image/jpeg"
# )
