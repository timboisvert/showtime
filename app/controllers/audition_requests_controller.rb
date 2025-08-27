class AuditionRequestsController < ApplicationController
  before_action :set_audition_request, only: %i[ show edit update destroy set_status ]
  before_action :set_production
  before_action :set_call_to_audition

  def index
    @audition_requests = AuditionRequest.all
  end

  def show
  end

  def new
    @audition_request = AuditionRequest.new
    @audition_request.status = :new
  end

  def edit
  end

def create
    @audition_request = AuditionRequest.new(audition_request_params)
    @audition_request.status = :new

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

  def set_status
    @audition_request.status = params.expect(:status)

    if @audition_request.save
      redirect_to @audition_request, notice: "Audition request status was successfully updated."
    else
      render :show, status: :unprocessable_entity
    end

  end

  private
    def set_audition_request
      @audition_request = AuditionRequest.find(params.expect(:id))
    end

    def set_production
      @production = Production.find(params.expect(:production_id))
    end

    def set_call_to_audition
      @call_to_audition = CallToAudition.find(params.expect(:call_to_audition_id))
    end

    def audition_request_params
      params.expect(audition_request: [ :call_to_audition_id, :person_id ])
    end
end
