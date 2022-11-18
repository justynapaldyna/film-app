require 'rails_helper'

describe Comment, type: :model do

    context 'relations' do
        
        it 'belongs to user' do
            expect(Comment.reflect_on_association(:user).macro).to match(:belongs_to)
        end

        it 'belongs to movie' do
            expect(Comment.reflect_on_association(:movie).macro).to match(:belongs_to)
        end   
    end

    context 'validations' do

        it 'not valid without body' do
            expect(Comment.new(body: nil)).not_to be_valid
        end

        it 'valid with body' do
            expect(Comment.new(body: 'Very nice movie')).to be_valid
        end
    end
end