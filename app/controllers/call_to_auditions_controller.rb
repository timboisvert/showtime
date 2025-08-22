class CallToAuditionsController < ApplicationController
  before_action :set_call_to_audition, only: %i[ show edit update destroy ]

  # GET /call_to_auditions
  def index
    @call_to_auditions = CallToAudition.all
  end

  # GET /call_to_auditions/1
  def show
  end

  # GET /call_to_auditions/new
  def new
    @call_to_audition = CallToAudition.new
  end

  # GET /call_to_auditions/1/edit
  def edit
  end

  # POST /call_to_auditions
  def create
    @call_to_audition = CallToAudition.new(call_to_audition_params)

    if @call_to_audition.save
      redirect_to @call_to_audition, notice: "Call to audition was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /call_to_auditions/1
  def update
    if @call_to_audition.update(call_to_audition_params)
      redirect_to @call_to_audition, notice: "Call to audition was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /call_to_auditions/1
  def destroy
    @call_to_audition.destroy!
    redirect_to call_to_auditions_path, notice: "Call to audition was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_to_audition
      @call_to_audition = CallToAudition.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def call_to_audition_params
      params.expect(call_to_audition: [ :production_id, :opens_at, :closes_at ])
    end
end
