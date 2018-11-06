class WeatherService

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def response
      conn.get("/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates[:lat]},#{@coordinates[:lng]}")
    end

    def conn
      Faraday.new(url: 'https://api.darksky.net')
    end
end
