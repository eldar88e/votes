NOMINATION = [{ title: 'Учитель' }, { title: 'Воспитатель' }, { title: 'Спортсмен' }, { title: 'Врач' }].freeze

biography = -> { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false)[0, 500] }

CANDIDATES =
  [{ title: Faker::Name.name, description: biography.call, img: '/images/mJXqgqRBLMW8xBHMP.jpg', nomination_id: 1 },
   { title: Faker::Name.name, description: biography.call, img: '/images/NqEMp50IkORLXlC.jpg', nomination_id: 1 },
   { title: Faker::Name.name, description: biography.call, img: '/images/YJXqgqRBLMW8xRY6nA.jpg', nomination_id: 1 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 2 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 2 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 2 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 3 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 3 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 3 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 4 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 4 },
   { title: Faker::Name.name, description: biography.call, img: '/images/alxa0366-1.jpg', nomination_id: 4 }].freeze

Nomination.create(NOMINATION)
Candidate.create(CANDIDATES)

# Faker::PhoneNumber.cell_phone
User.create(email: Faker::Internet.email, password: '123456', phone: '7978353456', status: true)
User.create(email: Faker::Internet.email, password: '123456', phone: '3214345435', status: true)
User.create(email: Faker::Internet.email, password: '123456', phone: '2589435345', status: true)
User.create(email: Faker::Internet.email, password: '123456', phone: '9632687668', status: true)
User.create(email: Faker::Internet.email, password: '123456', phone: '1478121233', status: true)
User.create(email: Faker::Internet.email, password: '123456', phone: '2584797899', status: true)
User.create(email: 'test@test.tt', password: '123456', phone: '90505111111', status: true)

rands = [(1..3), (4..6), (7..9), (10..12)]

users_ids = User.pluck(:id)
users_ids.pop
nominations = Nomination.pluck(:id)[0..-2]

users_ids.each do |id|
  nominations.each { |i| Vote.create(user_id: id, candidate_id: rand(rands[i - 1]), nomination_id: i) }
end

puts '*****The tables were filled!*****'
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?