class SearchController < ApplicationController

  def index
    render locals: {
      members: SearchResultsFacade.new.members(params[:house])
    }
  end
end
