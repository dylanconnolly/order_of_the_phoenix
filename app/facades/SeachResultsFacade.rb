class SearchResultsFacade

  def members(house)
    HouseMembers.order_members(house)
  end

  private

  def order_members(house)
    characters = PotterService.new.get_characters_by_house(house)

    characters.find_all do |character_info|
      character_info[:orderOfThePhoenix] == true
    end
  end
end
