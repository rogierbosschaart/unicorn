# agen_data = [
#   { name: "Marina", city: "Zierikzee" },
#   { name: "Kura", city: "Boulogne" },
#   { name: "Moda", city: "Dordrecht" },
# ]
# agencies = []
# agen_data.each_with_index do |agen, index|
#   user = users.sample
#   agency = Agency.new(
#   { name: "Marina", city: "Zierikzee" },
#   { name: "Kura", city: "Boulogne" },
#   { name: "Moda", city: "Dordrecht" },
#   )
  Agency.create!{ name: "Marina", city: "Zierikzee" },
  Agency.create!{ name: "Kura", city: "Boulogne" },
  Agency.create!{ name: "Moda", city: "Dordrecht" },
  # Attach image from URL
  # begin
  #   file = URI.open(agen[:image_url])
  #   agencies.photo.attach(io: file, filename: "#{agen[:name].parameterize}.jpg", content_type: "image/#{agen[:image_url].end_with?('png') ? 'png' : 'jpeg'}")
  # rescue => e
  #   puts "Error attaching image for #{agen[:name]}: #{e.message}"
  # end
#   agency.save!
#   agencies << agency
#   puts "Created agencie: '#{agency.name}' by #{user.username}"
# end
# puts "#{agencies.count} agencies created!"

# raise_data = [
#   { origin: "Amsterdam", destination: "Zierikzee", date_time: "03/06/2026 05:32" },
#   { origin: "Zierikzee", destination: "Kulemborg", date_time: "03/06/2026 23:48" },
#   { origin: "Kulemborg", destination: "Palau", date_time: "04/06/2026 12:32" },
# ]
# travels = []
# raise_data.each_with_index do |raise, index|
#   user = users.sample
#   travel = Travel.new(
#     origin: raise[:origin],
#     destination: raise[:destination],
#     date_time: raise[:date_time],
#   )
#   # Attach image from URL
#   # begin
#   #   file = URI.open(agen[:image_url])
#   #   agencies.photo.attach(io: file, filename: "#{agen[:name].parameterize}.jpg", content_type: "image/#{agen[:image_url].end_with?('png') ? 'png' : 'jpeg'}")
#   # rescue => e
#   #   puts "Error attaching image for #{agen[:name]}: #{e.message}"
#   # end
#     agencie.save!
#   agencies << agencie
#   puts "Created agencie: '#{agencie.name}' by #{user.username}"
# end
# puts "#{travels.count} agencies created!"

# inn_data = [
#   { name: "Hotel Zeeuws-Meisje", address: "Hoofdpoortstraat 2A, 4301 AM Zierikzee, Netherlands", extra_info: "This cozy boutique hotel is located in the center of Zierikzee" },
#   { name: "Pension De Appelgaard", address: "Culemborg, Gelderland, Netherlands", extra_info: "This charming guesthouse offers clean and quiet rooms, a delightful breakfast, and a relaxing atmosphere." },
#   { name: "Palau Pacific Resort", address: "Koror, Republic of Palau 96940", extra_info: "A luxurious resort hotel set on 64 acres of tropical forest, offering ideal conditions for a peaceful getaway." },
# ]
#   hotel.save!
#   hotels << hotel
#   puts "Created hotel: '#{hotel.name}' by #{user.username}"
# end
# puts "#{hotels.count} hotels created!"

# hotels = []
# raise_data.each_with_index do |inn, index|
#   user = users.sample
#   hotel = Hotel.new(
#     name: inn[:name],
#     address: inn[:address],
#     extra_info: inn[:extra_info],
#   )
#   # Attach image from URL
#   # begin
#   #   file = URI.open(agen[:image_url])
#   #   agencies.photo.attach(io: file, filename: "#{agen[:name].parameterize}.jpg", content_type: "image/#{agen[:image_url].end_with?('png') ? 'png' : 'jpeg'}")
#   # rescue => e
#   #   puts "Error attaching image for #{agen[:name]}: #{e.message}"
#   # end
#   hotel.save!
#   hotels << hotel
#   puts "Created travel: from '#{travel.origin}' to '#{travel.destination}' by #{user.username}"
# end
# puts "#{travels.count} agencies created!"
