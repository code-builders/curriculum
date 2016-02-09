require 'httparty'

class Pet
  attr_accessor :id, :name, :breed, :human, :species

  def initialize(attrs)
    @id      = attrs["id"]
    @name    = attrs["name"]
    @breed   = attrs["breed"]
    @human   = attrs["human"]
    @species = attrs["species"]
  end

  def self.find(id)
    response = HTTParty.get("https://cb-pets.herokuapp.com/pets/#{id}")
    self.new response.parsed_response
  end

  def self.all
    response = HTTParty.get("https://cb-pets.herokuapp.com/pets")
    response.parsed_response.collect do |pet_hash|
      self.new pet_hash
    end
  end
end
