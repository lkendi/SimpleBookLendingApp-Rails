require "test_helper"

class LendingTest < ActiveSupport::TestCase
  def setup
    @lending = lendings(:one)
  end

  test "lending is valid with valid attributes" do
    assert @lending.valid?
  end

  test "lending is invalid with empty borrower name" do
    @lending.borrower_name = ""
    assert_not @lending.valid?
    assert_includes @lending.errors[:borrower_name], "can't be blank"
  end

  test "lending is invalid with empty borrowed_at" do
    @lending.borrowed_at = ""
    assert_not @lending.valid?
    assert_includes @lending.errors[:borrowed_at], "can't be blank"
  end

  test "lending is valid with empty returned_at" do
    @lending.returned_at = nil
    assert @lending.valid?
  end

  test "lending is invalid with return date after borrow date" do
    @lending.returned_at = @lending.borrowed_at - 1.day
    assert_not @lending.valid?
    assert_includes @lending.errors[:returned_at], "must be after the date the book was borrowed"
  end
end
