require 'httparty'

class Weather
  attr_accessor :temp, :description
  def initialize(city)
    @city = city
  end

  def current_weather
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&appid=44db6a862fba0b067b1930da0d769e98")
  end

  def forecast
    r = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&appid=44db6a862fba0b067b1930da0d769e98")
    self.temp = r["main"]["temp"]
  end
end

w=Weather.new("Seattle").forecast
# <%= w.temp %>
