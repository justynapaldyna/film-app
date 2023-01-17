class HomeController < ApplicationController
  def index
    @cats = JSON.parse(Faraday.get("https://cataas.com/api/tags").body)
  end
end
