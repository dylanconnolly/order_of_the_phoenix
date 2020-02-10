class SearchController < ApplicationController

  def index
    render locals: {
      members: SearchResultsFacade.new.members("Gryffindor")
    }
  end
end
