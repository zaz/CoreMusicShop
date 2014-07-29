require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "products have correct value" do
    assert products(:one).price == 9.99
    assert products(:two).price == 189.99
  end
end
