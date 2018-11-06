class BackgroundImageService

  def initialize(data)
    @lat = data[:coordinates][:lat]
    @lng = data[:coordinates][:lng]
  end

  def get_backgrounds
    images_with_links.map do |raw_image_data|
      Background.new(raw_image_data)
    end
  end

  private
    def images_with_links
      get_json[:photos][:photo].find_all do |image|
        image[:url_o]
      end
    end

    def get_json
      JSON.parse(response.body, symbolize_names: true)
    end

    def response
      conn.get("/services/rest/?method=flickr.photos.search&api_key=#{ENV["flickr_api_key"]}&tags=parks, skyline, hi-res&accuracy=11&safe_search=1&lat=#{@lat}&lon=#{@lng}&extras=url_o&format=json&nojsoncallback=1")
    end

    def conn
      Faraday.new(url: 'https://api.flickr.com')
    end
end
