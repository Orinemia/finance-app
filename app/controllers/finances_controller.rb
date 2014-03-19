class FinancesController < ApplicationController
  before_action :set_finance, only: [:show, :edit, :update, :destroy]

  # GET /finances
  # GET /finances.json
  def index
    @finances = Finance.all
  end

  def select
    
    if params[:sector] == "all" && params[:location] == "all"
      @finances = Finance.all
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    elsif params[:sector] == "all" && params[:location] != "all"
      @finances = Finance.where("location like ?", "%#{params[:location]}%")
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    elsif params[:sector] != "all" && params[:location] == "all"
      @finances = Finance.where("sector like ?", "%#{params[:sector]}%")
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    else
      @finances = Finance.where("sector like ? AND location like ?", "%#{params[:sector]}%", "%#{params[:location]}%")
      @status = "We have found #{@finances.size} company(s) matching your criteria"
      if @finances.size == 0
        @status = "No companies found"
      end
    end
    @finances = @finances.order("name ASC")
    render :layout => 'select'
  end

  def search
    @finances = Finance.where("lower(location) like ? OR lower(sector) like ? OR lower(name) like ?", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%")
    @status = "We have found #{@finances.size} company(s) matching your criteria"
    @finances = @finances.order("name ASC")
  end

  def stats
    @finance = Finance.find(params[:id])
    if @finance.dividend_yield == nil
      @finance.dividend_yield = 0
    end
    if @finance.price_earnings == nil
      @finance.price_earnings = 0
    end
  end
  # GET /finances/1
  # GET /finances/1.json
  def show
    @finance = Finance.find(params[:id])
  end

  # GET /finances/new
  def new
    @finance = Finance.new
  end

  # GET /finances/1/edit
  def edit
  end

  # POST /finances
  # POST /finances.json
  def create
    @finance = Finance.new(finance_params)

    respond_to do |format|
      if @finance.save
        format.html { redirect_to @finance, notice: 'Finance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @finance }
      else
        format.html { render action: 'new' }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finances/1
  # PATCH/PUT /finances/1.json
  def update
    respond_to do |format|
      if @finance.update(finance_params)
        format.html { redirect_to @finance, notice: 'Finance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finances/1
  # DELETE /finances/1.json
  def destroy
    @finance.destroy
    respond_to do |format|
      format.html { redirect_to finances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finance_params
      params.require(:finance).permit(:name, :sector, :price, :dividend_yield, :price_earnings, :earnings_share, :book_value, :year_week_low, :year_week_high, :market_cap, :ebitda, :location)
    end
end
