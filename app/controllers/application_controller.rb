# require './app/poros/github_contributor_search'

class ApplicationController < ActionController::Base
  before_action :get_info, only: %i[index]

  def get_info
    @upcoming_holidays = SwaggerSearch.new.holiday_information
  end
end
