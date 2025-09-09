class AuditionSessionsController < ApplicationController
  before_action :set_audition_session, only: %i[ show edit update destroy ]
  before_action :set_production

  # GET /audition_sessions
  def index
    @audition_sessions = @production.audition_sessions
  end

  # GET /audition_sessions/1
  def show
  end

  # GET /audition_sessions/new
  def new
    @audition_session = AuditionSession.new

    if params[:duplicate].present?
      original = AuditionSession.find_by(id: params[:duplicate], production: @production)
      if original.present?
        @audition_session.start_at = original.start_at
        @audition_session.maximum_auditionees = original.maximum_auditionees
      end
    end
  end

  # GET /audition_sessions/1/edit
  def edit
  end

  # POST /audition_sessions
  def create
    @audition_session = AuditionSession.new(audition_session_params)
    @audition_session.production = @production

    if @audition_session.save
      redirect_to production_audition_sessions_path(@production), notice: "Audition session was successfully scheduled."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /audition_sessions/1
  def update
    if @audition_session.update(audition_session_params)
      redirect_to production_audition_sessions_path(@production), notice: "Audition session was successfully rescheduled.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /audition_sessions/1
  def destroy
    @audition_session.destroy!
    redirect_to production_audition_sessions_path(@production), notice: "Audition session was successfully canceled.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audition_session
      @audition_session = AuditionSession.find(params.expect(:id))
    end

    def set_production
      @production = Production.find(params.expect(:production_id))
    end

    # Only allow a list of trusted parameters through.
    def audition_session_params
      params.expect(audition_session: [ :production_id, :start_at, :end_at, :maximum_auditionees ])
    end
end
