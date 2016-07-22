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

  def test_in_bounds
    sw = Geokit::LatLng.new(55.943012, -3.103430)
    ne = Geokit::LatLng.new(55.943064, -3.103117)

    bounds = Geokit::Bounds.new(sw, ne)
    inside =  Geokit::LatLng.new(55.943037, -3.103274)

    assert_equal(bounds.contains?(inside), true)
  end

  def test_out_of_bounds
    sw = Geokit::LatLng.new(55.943012, -3.103430)
    ne = Geokit::LatLng.new(55.943064, -3.103117)

    bounds = Geokit::Bounds.new(sw, ne)
    outside =  Geokit::LatLng.new(55.943094, -3.102864)

    assert_equal(bounds.contains?(outside), false)
  end

end