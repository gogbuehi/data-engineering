require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "the total price of purchase" do
    purchase_a = Purchase.find(1)
    purchase_b = Purchase.find(2)
    assert_equal 1.5, purchase_a.total_price
    assert_equal 3, purchase_b.total_price
  end
end
