ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)
require 'json'

require_relative './swapi_client/rom'
require_relative './swapi_client/ostruct'

module SwapiClient

  def self.films
    @films ||= data 'films'
  end

  def self.people
    @people ||= data 'people'
  end

  def self.people_with_films
    @people_with_films ||= begin
      people.dup.each do |person|
        person['films'] = person['films'].map { |url| films.detect { |f| f['url'] == url } }
      end
    end
  end


  private

  def self.data(resource)
    cache = File.expand_path "../swapi_client/#{resource}.json", __FILE__
    return JSON.parse(File.read(cache)) if File.exists?(cache)
    resource_data = []
    resources = JSON.parse Hurley.get("http://swapi.co/api/#{resource}/").body
    loader = -> { resources['results'].each { |x| resource_data << x } }
    loader.call
    while resources['next'] do
      resources = JSON.parse Hurley.get(resources['next']).body
      loader.call
    end
    File.open(cache, 'w') { |f| f.write JSON.dump(resource_data) }
    resource_data
  end

end
