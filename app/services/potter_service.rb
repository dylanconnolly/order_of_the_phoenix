class PotterService

  def get_characters_by_house(house)
    get_json("characters?key=#{ENV['POTTER_API_KEY']}&house=#{house}")
  end

private

  def conn
    Faraday.new('https://www.potterapi.com/v1/') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(uri)
    response = conn.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end
end
