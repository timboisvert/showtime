class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ edit update destroy ]
  before_action :set_production
  before_action :set_call_to_audition

  # GET /questions
  def index
    @question = @call_to_audition.questions.new
    @questions = @call_to_audition.questions.all
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.questionable = @call_to_audition

    if @question.save
      redirect_to production_call_to_audition_questions_path(@production, @call_to_audition), notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to production_call_to_audition_questions_path(@production, @call_to_audition), notice: "Question was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy!
    redirect_to questions_path, notice: "Question was successfully deleted.", status: :see_other
  end

  private
    def set_question
      @question = Question.find(params.expect(:id))
    end

    def set_production
      @production = Production.find(params.expect(:production_id))
    end

    def set_call_to_audition
      @call_to_audition = CallToAudition.find(params.expect(:call_to_audition_id))
    end

    def question_params
      params.expect(question: [ :key, :text, :question_type, :questionable_id, :questionable_type ])
    end
end
