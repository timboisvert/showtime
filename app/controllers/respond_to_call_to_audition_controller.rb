class RespondToCallToAuditionController < ApplicationController
  before_action :get_call_to_audition_and_questions

  # Use the public facing layout
  layout "public_facing"

  def new
    # First we'll check if they've already responded to this call to audition
    if cookies.signed["#{@call_to_audition.hex_code}"]

      # The user has already responded, so look up their Person object and Audution Request
      @person = Person.find_by(email: cookies.signed["#{@call_to_audition.hex_code}"])
      @audition_request = @call_to_audition.audition_requests.find_by(person: @person)

      # Get the answers for these questions
      @answers = {}
      @questions.each do |question|
        answer = @audition_request.answers.find_by(question: question)
        @answers[question.id] = answer.value if answer
      end

    else
      # They haven't responded yet, so we'll let them create a new response
      @audition_request = AuditionRequest.new
      @person = @audition_request.build_person

      # Empty answers hash
      @answers = {}
      @questions.each do |question|
        @answers[question.id] = ""
      end

    end
  end

  def create
    # Strong parameters for the person
    person_params = params.require(:audition_request).permit(person: [ :stage_name, :email, :pronouns, :socials, :resume, :headshot ])

    # We may be updating an existing response, so check for that first
    if cookies.signed["#{@call_to_audition.hex_code}"]

      # Get the person and audition request
      @person = Person.find_by(email: cookies.signed["#{@call_to_audition.hex_code}"])
      @audition_request = @call_to_audition.audition_requests.find_by(person: @person)

      # Update the person with the new details
      @person.assign_attributes(person_params[:person])

      # Update the answers
      params[:question].each do |question_id, value|
        answer = @audition_request.answers.find_or_initialize_by(question: question_id)
        answer.value = value
        answer.save!
      end

    else

      # It's a new request, so instantiate the objects
      @audition_request = AuditionRequest.new
      @audition_request.call_to_audition = @call_to_audition
      @person = @audition_request.build_person(person_params[:person])

      # Loop through the questions and store the answers
      params[:question].each do |question_id, value|
        answer = @audition_request.answers.build
        answer.question = Question.find question_id
        answer.value = value
      end

    end

    # Assuming they're valid...
    if @audition_request.valid? && @person.valid?

      # ...save them both
      @person.save!
      @audition_request.save!

      # And set a cookie so we know this user has already responded
      cookies.signed["#{@call_to_audition.hex_code}"] = { value: @person.email, expires: 5.years.from_now }

      # Then send them on to the success page
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
