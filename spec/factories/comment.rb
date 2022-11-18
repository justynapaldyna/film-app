FactoryBot.define do 
    factory :comment do
        body { 'Nice movie'}
        user { create(:user) }
        movie { create(:movie) }
    end
end