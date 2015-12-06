require_relative './test_helper'

class ROMTest < SwapiClient::Spec

  let(:luke) { SwapiClient::PersonMapper.build.call([luke_data]).first }

  it 'can read simple properties' do
    luke.name.must_equal   'Luke Skywalker'
    luke.gender.must_equal 'male'
  end

  it 'exposes a known class' do
    luke.must_be_instance_of SwapiClient::PersonROM
  end

  it 'deprecates interfaces' do
    capture_warning {
      luke.hair_color.must_equal 'blond'
    }.must_equal 'Please use #appearance instead.'
  end

  it 'has a simple association' do
    luke.appearance.must_be_instance_of SwapiClient::AppearanceROM
    luke.appearance.hair_color.must_equal 'blond'
    luke.appearance.eye_color.must_equal  'blue'
  end


end
