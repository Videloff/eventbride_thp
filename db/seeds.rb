Attendance.delete_all
Event.delete_all
User.delete_all

# Créer 10 utilisateurs
2.times do
  User.create!(email: Faker::Internet.email(domain: 'yopmail.com'), password: Faker::Internet.password, description: Faker::Lorem.paragraph, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# Créer 5 events
3.times do
  Event.create(title: Faker::JapaneseMedia::OnePiece.quote, start_date: Faker::Date.forward(days: 10), duration: [5,10,15,20,25,30].sample, description: Faker::Lorem.sentence(word_count: 15), price: Faker::Number.between(from: 1, to: 1000), location: Faker::JapaneseMedia::OnePiece.location, admin_id: User.all.sample.id)
end