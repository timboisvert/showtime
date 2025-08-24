class AuditionRequestsController < ApplicationController
  before_action :set_audition_request, only: %i[ show edit update destroy ]
 
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

  private
    def set_audition_request
      @audition_request = AuditionRequest.find(params.expect(:id))
    end

    def audition_request_params
      params.expect(audition_request: [ :call_to_audition_id, :person_id ])
    end
end
