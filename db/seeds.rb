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

User.create(email: 'eldar0112@gmail.com', password: '123456')
User.create(email: 'eminov@gmail.com', password: '654321')
User.create(email: 'goo@gmail.com', password: '654321')
User.create(email: 'loo@gmail.com', password: '654321')
User.create(email: 'boo@gmail.com', password: '654321')
User.create(email: 'roo@gmail.com', password: '654321')

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