require 'rails_helper'

RSpec.describe V2::CategoriesController, type: :controller do

    describe 'GET #index' do 
        let!(:categories) { 
            build_list(:category, 10) do |record, i|
                record.name = i.to_s
                record.save!
            end
        } 
        subject { get :index }

        before { subject }

        it { expect(response.status).to eq(200) }

        it 'shows all categories' do 
            expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i }).to eq(Category.all.ids)
        end

            
    end
end
