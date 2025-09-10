class CastsController < ApplicationController
  before_action :set_production
  before_action :set_cast, only: %i[ show edit update destroy ]

  def index
    @casts = @production.casts.all
  end

  def show
  end

  def new
    @cast = @production.casts.new
  end

  def edit
  end

  def create
    @cast = @production.casts.new(cast_params)
    @cast.production = @production

    if @cast.save
      redirect_to production_casts_path(@production), notice: "Cast was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cast.update(cast_params)
      redirect_to production_casts_path(@production), notice: "Cast was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /casts/1
  def destroy
    @cast.destroy!
    redirect_to production_casts_path(@production), notice: "Cast was successfully deleted.", status: :see_other
  end

  private
    def set_production
      @production = Production.find(params.require(:production_id))
    end

    def set_cast
      @cast = @production.casts.find(params.require(:id))
    end

    def cast_params
      params.require(:cast).permit(:production_id, :name)
    end
end
