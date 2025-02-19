require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
  end

  test "should be valid with valid attributes" do
    assert @book.valid?
  end

  test "should be invalid with empty title" do
    @book.title = ""
    assert_not @book.valid?
    assert_includes @book.errors[:title], "can't be blank"
  end

  test "should be invalid with empty author" do
    @book.author = ""
    assert_not @book.valid?
    assert_includes @book.errors[:author], "can't be blank"
  end

  test "should be invalid with empty isbn" do
    @book.isbn = ""
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "can't be blank"
  end

  test "should be invalid with invalid isbn format" do
    @book.isbn = "123456789"
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "must be 10 or 13 digits"

    @book.isbn = "12345678901234567890"
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "must be 10 or 13 digits"

    @book.isbn = "1234a67890"
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "must be 10 or 13 digits"

    @book.isbn = 123456789
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "must be 10 or 13 digits"

    @book.isbn = 12345123456
    assert_not @book.valid?
    assert_includes @book.errors[:isbn], "must be 10 or 13 digits"
  end

  test "should be invalid with non-unique isbn" do
    duplicate_book = @book.dup
    @book.save!
    assert_not duplicate_book.valid?
    assert_includes duplicate_book.errors[:isbn], "already exists"
  end

  test "destroying a book destroys its lendings" do
    @book.lendings.create!(borrower_name: "Test Borrower", borrowed_at: Time.current)
    assert_difference("Lending.count", -@book.lendings.count) do
      @book.destroy
    end
  end
end
