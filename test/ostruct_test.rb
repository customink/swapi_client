require_relative './test_helper'

class OstructTest < SwapiClient::Spec

  let(:luke) { SwapiClient::PersonOS.new(luke_data) }

  it 'can read simple properties' do
    luke.name.must_equal   'Luke Skywalker'
    luke.gender.must_equal 'male'
  end

  it 'exposes a known class' do
    luke.must_be_instance_of SwapiClient::PersonOS
  end

  it 'deprecates interfaces' do
    capture_warning {
      luke.hair_color.must_equal 'blond'
    }.must_equal 'Please use #appearance instead.'
  end

  it 'has a simple association' do
    luke.appearance.must_be_instance_of SwapiClient::AppearanceOS
    luke.appearance.hair_color.must_equal 'blond'
    luke.appearance.eye_color.must_equal  'blue'
  end


end
