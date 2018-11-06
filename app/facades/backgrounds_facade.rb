class BackgroundsFacade


  def initialize(location)
    @location = location
  end

  def return_random_image
    BackgroundSerializer.new(retrieve_image_links.sample).serializable_hash
  end

  def retrieve_image_links
    geocode_data = GeocodeService.new(@location).formatted_address_and_coordinates
    BackgroundImageService.new(geocode_data).get_backgrounds
  end
end
