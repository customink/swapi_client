require_relative '../swapi_client'
require 'ostruct'

module SwapiClient

  class PersonOS < OpenStruct

    def hair_color
      warn 'Please use #appearance instead.'
      self[:hair_color]
    end

    def appearance
      @appearance ||= AppearanceOS.new({
        hair_color: self[:hair_color],
        skin_color: self[:skin_color],
        eye_color: self[:eye_color]
      })
    end

  end

  class AppearanceOS < OpenStruct

  end

end
