class SearchResultsFacade

  def members(house)
    HouseMembers.new.order_members(house)
  end
end
