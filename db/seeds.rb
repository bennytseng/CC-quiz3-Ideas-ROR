IDEAS_TO_CREATE = 50

IDEAS_TO_CREATE.times do
  Idea.create title:      Faker::StarWars.quote,
              body:       Faker::Hipster.paragraph,
              user_id: 1
end
