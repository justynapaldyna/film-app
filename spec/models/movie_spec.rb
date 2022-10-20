require 'rails_helper'

describe Movie, type: :model do

    context 'relations' do
        it 'belongs to user' do
          expect(Movie.reflect_on_association(:user).macro).to match(:belongs_to)
        end

        it 'belongs to category' do
            expect(Movie.reflect_on_association(:category).macro).to match(:belongs_to)
        end
    end

    context 'validations' do
        let(:user) { create(:user) }
        let(:category) {create(:category) }

        it 'not valid without title' do
            expect(Movie.new(title: nil, year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without year' do
            expect(Movie.new(title: 'Movie title', year: nil, description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without description' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: nil, movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without movie_length' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: nil, director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without director' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: nil, language: 'English', rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without language' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: nil, rating: 'PG-13', user: user, category: category )).not_to be_valid
        end

        it 'not valid without rating' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: nil, user: user, category: category )).not_to be_valid
        end

        it 'valid with params' do
            expect(Movie.new(title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category )).to be_valid
        end
    end
end
        