require 'faker'

def create_static_user(attributes)
  unless User.find_by(email: attributes[:email])
    static_user = User.create!(attributes)
    static_user.skip_confirmation!
    static_user.save!
    puts "Email: #{attributes[:email]} Password: #{attributes[:password]}"
  else
    puts "Skipped creation of \"#{attributes[:email]}\""
  end
end

# Create Users
10.times do
  user = User.new(
    email:     Faker::Internet.email,
    password: 'helloworld'
    )
  user.skip_confirmation!
  user.save!
end
puts "Random Users created."

# Create an admin user
create_static_user({
  email:      'admin@example.com',
  password:   'helloworld',
})


# Create a premium user
create_static_user({
  email:      'premium@example.com',
  password:   'helloworld',
})

# Create member user
create_static_user({
  email:      'member@example.com',
  password:   'helloworld',
})

users = User.all

puts "#{User.count} users created."

puts "Seed finished"