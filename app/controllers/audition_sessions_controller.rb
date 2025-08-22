class AuditionSessionsController < ApplicationController
  before_action :set_audition_session, only: %i[ show edit update destroy ]

  # GET /audition_sessions
  def index
    @audition_sessions = AuditionSession.all
  end

  # GET /audition_sessions/1
  def show
  end

  # GET /audition_sessions/new
  def new
    @audition_session = AuditionSession.new
  end

  # GET /audition_sessions/1/edit
  def edit
  end

  # POST /audition_sessions
  def create
    @audition_session = AuditionSession.new(audition_session_params)

    if @audition_session.save
      redirect_to @audition_session, notice: "Audition session was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /audition_sessions/1
  def update
    if @audition_session.update(audition_session_params)
      redirect_to @audition_session, notice: "Audition session was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /audition_sessions/1
  def destroy
    @audition_session.destroy!
    redirect_to audition_sessions_path, notice: "Audition session was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audition_session
      @audition_session = AuditionSession.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audition_session_params
      params.expect(audition_session: [ :call_to_audition_id, :date_and_time, :maximum_auditionees ])
    end
end
