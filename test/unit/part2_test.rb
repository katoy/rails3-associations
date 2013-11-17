# coding: utf-8

require 'test_helper'

class Part2Test < ActiveSupport::TestCase
  setup do
    @part2_1 = Fabricate(:part2)
  end

  test "should get has_many" do
    assert_equal @part2_1.name, "part_name-10000"
  end

end
