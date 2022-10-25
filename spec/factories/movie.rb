FactoryBot.define do
    factory :movie do
        title { 'Movie title' }
        year { '2022' }
        description { 'Lorem Ipsum' }
        movie_length { '1h0m' }
        director { 'Mr Director' }
        language { 'English' }
        rating { 'PG-13' }
        user { create(:user) }
        category { create(:category) }
    end
end