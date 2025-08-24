class AuditionRequestsController < ApplicationController

  before_action :set_audition_request, only: %i[ show edit update destroy ]

  # Set a custom layout for the public facing respond_to_call_to_audition action
  layout "public_facing", only: [:respond_to_call_to_audition]

  
  def index
    @audition_requests = AuditionRequest.all
  end

  def show
  end

  def new
    @audition_request = AuditionRequest.new
  end

  def edit
  end

def create
    @audition_request = AuditionRequest.new(audition_request_params)

    if @audition_request.save
      redirect_to @audition_request, notice: "Audition request was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @audition_request.update(audition_request_params)
      redirect_to @audition_request, notice: "Audition request was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @audition_request.destroy!
    redirect_to audition_requests_path, notice: "Audition request was successfully destroyed.", status: :see_other
  end





  # Public facing endpoint that shows a form and allows a person to
  # respond to a call to audition using the call to audition's unique hex code
  def respond_to_call_to_audition
    @call_to_audition = CallToAudition.find_by(hex_code: params[:hex_code].upcase)

    if @call_to_audition.nil?
      redirect_to root_path, alert: "Invalid call to audition"
      return  
    end

    @production = @call_to_audition.production
    @questions = @call_to_audition.questions
    @audition_request = AuditionRequest.new
    @person = @audition_request.build_person
  end





  private
    def set_audition_request
      @audition_request = AuditionRequest.find(params.expect(:id))
    end

    def audition_request_params
      params.expect(audition_request: [ :call_to_audition_id, :person_id ])
    end
end
