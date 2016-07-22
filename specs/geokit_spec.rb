require 'minitest/autorun'
require 'minitest/rg'
require 'geokit'

class GeoKitTest < Minitest::Test

  def setup
    Geokit::default_units = :kms
  end

  def test_distance_between_two_points
    first_point =  Geokit::LatLng.new(55.942008, -3.101674)
    second_point =  Geokit::LatLng.new(55.941878, -3.101607)
    distance = first_point.distance_to(second_point)
    assert_in_delta(0.015, distance, 0.0001)
  end

end