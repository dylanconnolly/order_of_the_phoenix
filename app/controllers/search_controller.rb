class SearchController < ApplicationController

  def index
    connection = Faraday.new('https://www.potterapi.com/v1/') do |f|
      f.adapter Faraday.default_adapter
    end

    response = connection.get("characters?key=#{ENV['POTTER_API_KEY']}&house=Gryffindor")

    gryffindor_members = JSON.parse(response.body, symbolize_names: true)

    order_members = gryffindor_members.find_all do |member_info|
      member_info[:orderOfThePhoenix] == true
    end

    @members = order_members.map do |member_info|
      Member.new(member_info)
    end
  end
end
