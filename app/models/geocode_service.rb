class GeocodeService

  def initialize(address)
    @address = address
  end

  def formatted_address_and_coordinates
    results = geocode_results
    {formatted_address: results[:formatted_address], coordinates: results[:geometry][:location]}
  end

  private
    def geocode_results
      get_json[:results][0]
    end

    def get_json
      JSON.parse(response.body, symbolize_names: true)
    end

    def response
      conn.get("/maps/api/geocode/json?address=#{@address}&key=#{ENV["google_api_key"]}")
    end

    def conn
      Faraday.new(url: 'https://maps.googleapis.com')
    end
end
