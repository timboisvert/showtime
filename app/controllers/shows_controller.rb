class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]
  before_action :set_production

  # GET /shows/1
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  def create
    @show = Show.new(show_params)
    @show.production = @production

    if @show.save
      redirect_to production_shows_path(@production), notice: "Show was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shows/1
  def update
    if @show.update(show_params)
      redirect_to production_shows_path(@production), notice: "Show was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shows/1
  def destroy
    @show.destroy!
    redirect_to production_shows_path(@production), notice: "Show was successfully deleted.", status: :see_other
  end

  private
    def set_show
      @show = Show.find(params.expect(:id))
    end

    def set_production
      @production = Production.find(params.expect(:production_id))
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.expect(show: [ :secondary_name, :date_and_time, :production_id ])
    end
end
