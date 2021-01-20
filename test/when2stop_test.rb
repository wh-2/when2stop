require 'test_helper'

class When2stop::Test < ActiveSupport::TestCase
  include When2stop
  test "truth" do
    assert_kind_of Module, When2stop
  end

  test "iterate enum" do
    elapsed_time = iterate enum: (1..20), for:1.minute do |el|
      puts el
      sleep 5.seconds
    end
    assert_in_delta elapsed_time, 1.minute, 5.seconds
  end

  test 'iterate with action' do
    number = 1
    elapsed_time = iterate for: 1.minute do
      puts number
      sleep 5.seconds
    end
    assert_in_delta elapsed_time, 1.minute, 5.seconds
  end

  test "iterate enum and break in 3" do
    last_iterated = 0
    iterate enum: (1..20), for:1.minute, break_when_returns: 3 do |el|
      puts el
      sleep 5.seconds
      last_iterated = el
      el
    end
    assert_equal 3, last_iterated
  end

  test 'iterate with action and break in 3' do
    number = 1
    iterate for: 1.minute, break_when_returns: 3 do
      puts number
      sleep 5.seconds
      number += 1
      number
    end
    assert_equal 3, number
  end
end
