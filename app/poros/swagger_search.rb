require "./app/poros/holiday"
require "./app/services/swagger_services"

class SwaggerSearch
  def holiday_information
    service.holidays.map do |data|
      Holiday.new(data)
    end

  end

  def service
    SwaggerService.new
  end
end