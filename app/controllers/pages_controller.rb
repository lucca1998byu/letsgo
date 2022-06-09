class PagesController < ApplicationController
  def home
    @sidebar = 'home'
    @feed_header = 'home'
    @events = Event.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        image_url: helpers.asset_url("marker.jpg")
      }
    end
  end
end
