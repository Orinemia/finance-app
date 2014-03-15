require 'test_helper'

class FinancesControllerTest < ActionController::TestCase
  setup do
    @finance = finances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finance" do
    assert_difference('Finance.count') do
      post :create, finance: { book_value: @finance.book_value, dividend_yield: @finance.dividend_yield, earnings_share: @finance.earnings_share, ebitda: @finance.ebitda, market_cap: @finance.market_cap, name: @finance.name, price: @finance.price, price_earnings: @finance.price_earnings, sector: @finance.sector, year_week_high: @finance.year_week_high, year_week_low: @finance.year_week_low }
    end

    assert_redirected_to finance_path(assigns(:finance))
  end

  test "should show finance" do
    get :show, id: @finance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finance
    assert_response :success
  end

  test "should update finance" do
    patch :update, id: @finance, finance: { book_value: @finance.book_value, dividend_yield: @finance.dividend_yield, earnings_share: @finance.earnings_share, ebitda: @finance.ebitda, market_cap: @finance.market_cap, name: @finance.name, price: @finance.price, price_earnings: @finance.price_earnings, sector: @finance.sector, year_week_high: @finance.year_week_high, year_week_low: @finance.year_week_low }
    assert_redirected_to finance_path(assigns(:finance))
  end

  test "should destroy finance" do
    assert_difference('Finance.count', -1) do
      delete :destroy, id: @finance
    end

    assert_redirected_to finances_path
  end
end
