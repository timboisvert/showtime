class ShowCastAssignmentsController < ApplicationController
  before_action :set_show_cast_assignment, only: %i[ show edit update destroy ]

  # GET /show_cast_assignments
  def index
    @show_cast_assignments = ShowCastAssignment.all
  end

  # GET /show_cast_assignments/1
  def show
  end

  # GET /show_cast_assignments/new
  def new
    @show_cast_assignment = ShowCastAssignment.new
  end

  # GET /show_cast_assignments/1/edit
  def edit
  end

  # POST /show_cast_assignments
  def create
    @show_cast_assignment = ShowCastAssignment.new(show_cast_assignment_params)

    if @show_cast_assignment.save
      redirect_to @show_cast_assignment, notice: "Show cast assignment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /show_cast_assignments/1
  def update
    if @show_cast_assignment.update(show_cast_assignment_params)
      redirect_to @show_cast_assignment, notice: "Show cast assignment was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /show_cast_assignments/1
  def destroy
    @show_cast_assignment.destroy!
    redirect_to show_cast_assignments_path, notice: "Show cast assignment was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_cast_assignment
      @show_cast_assignment = ShowCastAssignment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def show_cast_assignment_params
      params.expect(show_cast_assignment: [ :show_id, :person_id, :cast_role_id ])
    end
end
