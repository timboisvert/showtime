class CallToAuditionsController < ApplicationController
  before_action :set_call_to_audition, only: %i[ show edit update destroy ]
  before_action :set_production

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
    @call_to_audition.production = @production

    # Create a random hex code for the audition link
    @call_to_audition.hex_code = SecureRandom.hex(5).upcase

    if @call_to_audition.save
      redirect_to [@production, @call_to_audition], notice: "Call to Audition was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /call_to_auditions/1
  def update
    if @call_to_audition.update(call_to_audition_params)
      redirect_to [@production, @call_to_audition], notice: "Call to Audition was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /call_to_auditions/1
  def destroy
    @call_to_audition.destroy!
    redirect_to @production, notice: "Call to Audition was successfully deleted.", status: :see_other
  end

  private
    def set_call_to_audition
      @call_to_audition = CallToAudition.find(params.expect(:id))
    end

    def set_production
      @production = Production.find(params.expect(:production_id))
    end

    # Only allow a list of trusted parameters through.
    def call_to_audition_params
      params.expect(call_to_audition: [ :production_id, :opens_at, :closes_at, :header_text, :use_person_object, :hex_code ])
    end
end
