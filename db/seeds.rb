
# Create an initial user if one doesn't already exist
tim = User.find_or_create_by(email_address: 'boisvert@gmail.com') do |user|
  user.password = 'password'
end

puts "Tim created or found: #{tim.email_address}"

pc = ProductionCompany.find_or_create_by(name: 'CocoRunsEverything') do |pc|
end

p = Production.find_or_create_by(name: 'Comedy Pageant', production_company: pc) do |production|
end
