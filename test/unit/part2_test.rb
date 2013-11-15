# coding: utf-8

require 'test_helper'

class Part2Test < ActiveSupport::TestCase
  setup do
    @part2_1 = part2s(:one)
  end

  test "should get has_many" do
    assert_equal @part2_1.name, "part2_1"

    # has_many
    # assert_equal @part2_1.subscriptions.size, 2
    # assert_equal @part2_1.xassemblies.size, 2

  end

end
