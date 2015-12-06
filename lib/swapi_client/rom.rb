require_relative '../swapi_client'

module SwapiClient

  class PersonROM < OpenStruct

    def hair_color
      warn 'Please use #appearance instead.'
      self[:hair_color]
    end

  end

  class AppearanceROM < OpenStruct

  end

  class PersonMapper < ROM::Mapper
    model PersonROM
    wrap :appearance do
      model AppearanceROM
    end
  end

end
