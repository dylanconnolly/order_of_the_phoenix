class HouseMembers

  def order_members(house)
    all_house_characters = PotterService.new.get_characters_by_house(house)

    all_house_characters.find_all do |character_info|
      character_info[:orderOfThePhoenix] == true
    end
  end
end
