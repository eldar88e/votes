NOMINATION = [{ title: 'Учитель'}, { title: 'Воспитатель'}, { title: 'Спортсмен'}, { title: 'Врач'}]

CANDIDATES =
  [{ title: 'Нина Николаевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 1},
   { title: 'Ирина Николаевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 1},
   { title: 'Надежда Ивановна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 1},
   { title: 'Алла Александровна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 2},
   { title: 'Кира Васильевна', description: 'Когда-то давным давно в 1-ой школе деревне была лучшим учителем математики.', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 2},
   { title: 'Вася', description: 'Когда-то давным давно...', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 3},
   { title: 'Петя', description: 'Когда-то давным давно...', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 3},
   { title: 'Любовь Григорьевна', description: 'Когда-то давным давно...', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 4},
   { title: 'Людмила Михайловна', description: 'Когда-то давным давно...', img: 'https://teacher-of-russia.ru/docs/2022/photos/news_05.10.2022.jpg', nomination_id: 4}]

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

User.create(email: 'fake01@gmail.com', password: '123456', phone: '7978', status: true)
User.create(email: 'fake02@gmail.com', password: '123456', phone: '3214', status: true)
User.create(email: 'fake03@gmail.com', password: '123456', phone: '2589', status: true)
User.create(email: 'fake04@gmail.com', password: '123456', phone: '9632', status: true)
User.create(email: 'fake05@gmail.com', password: '123456', phone: '1478', status: true)
User.create(email: 'fake06@gmail.com', password: '123456', phone: '2584', status: true)

Vote.create([
              { user_id: 2, candidate_id: 1 },
              { user_id: 2, candidate_id: 4 },
              { user_id: 2, candidate_id: 7 },
              { user_id: 3, candidate_id: 3 },
              { user_id: 3, candidate_id: 5 },
              { user_id: 3, candidate_id: 6 },
              { user_id: 4, candidate_id: 2 },
              { user_id: 4, candidate_id: 4 },
              { user_id: 4, candidate_id: 6 },
              { user_id: 5, candidate_id: 3 },
              { user_id: 5, candidate_id: 4 },
              { user_id: 5, candidate_id: 6 },
              { user_id: 6, candidate_id: 9 }
            ])
puts '*****The tables were filled!*****'