NOMINATION = [{ title: 'Учитель'}, { title: 'Воспитатель'}, { title: 'Спортсмен'}, { title: 'Врач'}]

CANDIDATES =
  [{ title: 'Нина Николаевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: '/images/mJXqgqRBLMW8xBHMP.jpg', nomination_id: 1},
   { title: 'Ирина Николаевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: '/images/NqEMp50IkORLXlC.jpg', nomination_id: 1},
   { title: 'Надежда Ивановна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: '/images/YJXqgqRBLMW8xRY6nA.jpg', nomination_id: 1},
   { title: 'Алла Александровна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: '/images/alxa0366-1.jpg', nomination_id: 2},
   { title: 'Кира Васильевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: '/images/alxa0366-1.jpg', nomination_id: 2},
   { title: 'Елена Петровна', description: 'Елена Петровна Иванова работает воспитателем с 2008 года.', img: '/images/alxa0366-1.jpg', nomination_id: 2},
   { title: 'Вася', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 3},
   { title: 'Петя', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 3},
   { title: 'Коля', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 3},
   { title: 'Любовь Григорьевна', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 4},
   { title: 'Анна Игоревна', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 4},
   { title: 'Людмила Михайловна', description: 'Когда-то давным давно...', img: '/images/alxa0366-1.jpg', nomination_id: 4}]

NOMINATION.each do |nomination|
  Nomination.create(title: nomination[:title])
rescue
  next
end

CANDIDATES.each do |candidate|
  Candidate.create(title: candidate[:title],
                   description: candidate[:description],
                   img: candidate[:img],
                   nomination_id: candidate[:nomination_id])
end

User.create(email: 'fake01@gmail.com', password: '123456', phone: '7978353456', status: true)
User.create(email: 'fake02@gmail.com', password: '123456', phone: '3214345435', status: true)
User.create(email: 'fake03@gmail.com', password: '123456', phone: '2589435345', status: true)
User.create(email: 'fake04@gmail.com', password: '123456', phone: '9632687668', status: true)
User.create(email: 'fake05@gmail.com', password: '123456', phone: '1478121233', status: true)
User.create(email: 'fake06@gmail.com', password: '123456', phone: '2584797899', status: true)
User.create(email: 'test@test.tt', password: '123456', phone: '90505111111', status: true)

rands = [(1..3), (4..6), (7..9), (10..12)]

users_ids = User.all.pluck(:id)
users_ids.pop
count_nom = Nomination.all.pluck(:id)

users_ids.each do |id|
  count_nom.each do |i|
    Vote.create(user_id: id, candidate_id: rand(rands[i-1]), nomination_id: i)
  end
end

puts '*****The tables were filled!*****'