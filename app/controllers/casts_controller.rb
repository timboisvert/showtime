class CastsController < ApplicationController
  before_action :set_cast, only: %i[ show edit update destroy ]

  # GET /casts
  def index
    @casts = Cast.all
  end

  # GET /casts/1
  def show
  end

  # GET /casts/new
  def new
    @cast = Cast.new
  end

  # GET /casts/1/edit
  def edit
  end

  # POST /casts
  def create
    @cast = Cast.new(cast_params)

    if @cast.save
      redirect_to @cast, notice: "Cast was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /casts/1
  def update
    if @cast.update(cast_params)
      redirect_to @cast, notice: "Cast was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /casts/1
  def destroy
    @cast.destroy!
    redirect_to casts_path, notice: "Cast was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast
      @cast = Cast.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cast_params
      params.expect(cast: [ :production_id, :name ])
    end
end
