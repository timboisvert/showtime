class ProductionCompaniesController < ApplicationController
  before_action :set_production_company, only: %i[ show edit update destroy ]

  # GET /production_companies
  def index
    @production_companies = ProductionCompany.all
  end

  # GET /production_companies/1
  def show
  end

  # GET /production_companies/new
  def new
    @production_company = ProductionCompany.new
  end

  # GET /production_companies/1/edit
  def edit
  end

  # POST /production_companies
  def create
    @production_company = ProductionCompany.new(production_company_params)

    if @production_company.save
      redirect_to @production_company, notice: "Production company was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /production_companies/1
  def update
    if @production_company.update(production_company_params)
      redirect_to @production_company, notice: "Production company was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /production_companies/1
  def destroy
    @production_company.destroy!
    redirect_to production_companies_path, notice: "Production company was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_company
      @production_company = ProductionCompany.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def production_company_params
      params.expect(production_company: [ :name ])
    end
end
