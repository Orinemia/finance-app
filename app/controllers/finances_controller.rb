class FinancesController < ApplicationController
  before_action :set_finance, only: [:show, :edit, :update, :destroy]

  # GET /finances
  # GET /finances.json
  def index
    @finances = Finance.all
  end

  def select
    
    if params[:sector] == "all" && params[:name] == "all"
      @finances = Finance.all
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    elsif params[:sector] == "all" && params[:name] != "all"
      @finances = Finance.where("name = ?", params[:name])
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    elsif params[:sector] != "all" && params[:name] == "all"
      @finances = Finance.where("sector = ?", params[:sector])
      @status = "We have found #{@finances.size} company(s) matching your criteria"
    else
      @finances = Finance.where("sector = ? AND name = ?", params[:sector], params[:name])
      @status = "We have found #{@finances.size} company(s) matching your criteria"
      if @finances.size == 0
        @status = "No companies found"
      end
    end
    render :layout => 'select'
  end
  # GET /finances/1
  # GET /finances/1.json
  def show
    @finances = Finance.find(params[:id])
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
      params.require(:finance).permit(:name, :sector, :price, :dividend_yield, :price_earnings, :earnings_share, :book_value, :year_week_low, :year_week_high, :market_cap, :ebitda)
    end
end
