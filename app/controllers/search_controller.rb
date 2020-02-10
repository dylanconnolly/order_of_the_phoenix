class SearchController < ApplicationController

  def index
    connection = Faraday.new('https://www.potterapi.com/v1/') do |f|
      f.adapter Faraday.default_adapter
    end

    response = connection.get("characters?key=#{ENV['POTTER_API_KEY']}&house=Gryffindor")

    gryffindor_members = JSON.parse(response.body)
    
    require "pry"; binding.pry
  end
end
