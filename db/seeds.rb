require 'faker'

# Create test admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
  # role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create test member user
moderator = User.new(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld'
  # role:     'premium'
)
moderator.skip_confirmation!
moderator.save!

# Create test member user
member = User.new(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld'
  # role:     'standard'
)
member.skip_confirmation!
member.save!


# Create users
3.times do
  user = User.new(
  name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  # role:     'standard'
  )
  user.skip_confirmation!
  user.save!
end

users = User.all


# Create Wikis
  30.times do
    Wiki.create!(
    title: Faker::Company.bs,
    body: Faker::Company.bs 
  )
end

Wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} lists created"
# puts "#{.count} items created"