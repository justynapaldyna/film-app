class V2::CategoriesController < ApplicationController
    def index 
        categories = Category.all 
        render json: categories, each_serializer: CategorySerializer
    end
end