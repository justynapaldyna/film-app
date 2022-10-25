require 'rails_helper'

describe Category, type: :model do

    context 'relations' do

        it 'has many movies' do
            expect(Category.reflect_on_association(:movies).macro).to match(:has_many)
        end

    end

    context 'validations' do

        it 'not valid without name' do
            expect(Category.new(name: nil)).not_to be_valid
        end

        it 'valid with name' do
            expect(Category.new(name: 'Drama')).to be_valid
        end
    end
end