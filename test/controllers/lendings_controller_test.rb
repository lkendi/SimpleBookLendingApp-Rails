require "test_helper"

class LendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lending = lendings(:one)
    @book = books(:one)
  end

  test "should get index" do
    get lendings_url
    assert_response :success
  end

  test "should get index with search filter" do
    get lendings_url, params: { search: @lending.borrower_name }
    assert_response :success
  end

  test "should get index with active filter" do
    get lendings_url, params: { active: "true" }
    assert_response :success
  end

  test "should get new" do
    get new_lending_url
    assert_response :success
  end

  test "should get new with book_id" do
    get new_lending_url, params: { book_id: @book.id }
    assert_response :success
    assert_includes @response.body, @book.title
  end

  test "should create lending" do
    assert_difference("Lending.count") do
      post lendings_url, params: { lending: { book_id: @book.id, borrower_name: "Test Borrower" } }
    end
    assert_redirected_to lendings_url
    assert_equal "Lending was successfully created.", flash[:notice]
  end

  test "should not create lending with invalid parameters" do
    assert_no_difference("Lending.count") do
      post lendings_url, params: { lending: { book_id: nil, borrower_name: "", borrowed_at: nil } }
    end
    assert_response :unprocessable_entity
  end

  test "should update lending" do
    @lending.update(borrowed_at: 1.hour.ago, returned_at: nil)
    patch lending_url(@lending)
    assert_redirected_to lendings_url
    assert_equal "Lending was successfully updated.", flash[:notice]
    @lending.reload
    assert_not_nil @lending.returned_at
    assert_operator @lending.returned_at, :>, @lending.borrowed_at
  end
end
