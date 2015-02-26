User.create!(username: 'jason',
             password: 'password',
             password_confirmation: 'password')
             
50.times do |x|
    name = Faker::Name.first_name
    password = password_confirmation = 'password'
    User.create!(username: name,
                 password: password,
                 password_confirmation: password_confirmation)
end

users = User.order(:created_at).take(6)
12.times do |x|
    users.each do |user|
       name = "#{Faker::App.name} #{Faker::App.name}"
       date = Faker::Time.between(1.year.ago, 1.year.from_now)
       event = user.events.create!(name: name, date: date)
       attendees = User.all.sample(10)
       event.attendees.concat(attendees)
    end
end