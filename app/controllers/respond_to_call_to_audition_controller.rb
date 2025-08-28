class RespondToCallToAuditionController < ApplicationController
  before_action :get_call_to_audition_and_questions

  # Use the public facing layout
  layout "public_facing"

  def new
    @audition_request = AuditionRequest.new
    @person = @audition_request.build_person
  end

  def create
    # Strong parameters for the person
    person_params = params.require(:audition_request).permit(person: [ :stage_name, :email, :pronouns, :socials, :resume, :headshot ])

    # Instantiate the objects
    @audition_request = AuditionRequest.new
    @audition_request.call_to_audition = @call_to_audition
    @person = @audition_request.build_person(person_params[:person])

    # Loop through the questions and store the answers
    params[:question].each do |question_id, value|
      answer = @audition_request.answers.build
      answer.question = Question.find question_id
      answer.value = value
    end

    if @audition_request.valid? && @person.valid?
      @person.save!
      @audition_request.save!

      redirect_to respond_to_call_to_audition_success_path(hex_code: @call_to_audition.hex_code), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def success
  end

  def get_call_to_audition_and_questions
    @call_to_audition = CallToAudition.find_by(hex_code: params[:hex_code].upcase)
    @questions = @call_to_audition.questions

    if @call_to_audition.nil?
      redirect_to root_path, alert: "Invalid call to audition"
      return
    end

    @production = @call_to_audition.production
  end
end
