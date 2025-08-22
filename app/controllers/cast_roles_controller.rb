class CastRolesController < ApplicationController
  before_action :set_cast_role, only: %i[ show edit update destroy ]

  # GET /cast_roles
  def index
    @cast_roles = CastRole.all
  end

  # GET /cast_roles/1
  def show
  end

  # GET /cast_roles/new
  def new
    @cast_role = CastRole.new
  end

  # GET /cast_roles/1/edit
  def edit
  end

  # POST /cast_roles
  def create
    @cast_role = CastRole.new(cast_role_params)

    if @cast_role.save
      redirect_to @cast_role, notice: "Cast role was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cast_roles/1
  def update
    if @cast_role.update(cast_role_params)
      redirect_to @cast_role, notice: "Cast role was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cast_roles/1
  def destroy
    @cast_role.destroy!
    redirect_to cast_roles_path, notice: "Cast role was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast_role
      @cast_role = CastRole.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cast_role_params
      params.expect(cast_role: [ :cast_id, :name ])
    end
end
