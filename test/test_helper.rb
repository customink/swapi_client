require_relative '../lib/swapi_client'
require 'minitest/spec'
require 'minitest/autorun'

module SwapiClient
  class Spec < MiniTest::Spec

    let(:luke_data) { SwapiClient.people.detect { |d| d['name'] == 'Luke Skywalker'} }


    private

    def capture_warning
      stderr, $stderr = $stderr, StringIO.new
      yield
      $stderr.string.chomp
    ensure
      $stderr = stderr
    end

  end
end
