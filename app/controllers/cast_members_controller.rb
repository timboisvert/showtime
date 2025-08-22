class CastMembersController < ApplicationController
  before_action :set_cast_member, only: %i[ show edit update destroy ]

  # GET /cast_members
  def index
    @cast_members = CastMember.all
  end

  # GET /cast_members/1
  def show
  end

  # GET /cast_members/new
  def new
    @cast_member = CastMember.new
  end

  # GET /cast_members/1/edit
  def edit
  end

  # POST /cast_members
  def create
    @cast_member = CastMember.new(cast_member_params)

    if @cast_member.save
      redirect_to @cast_member, notice: "Cast member was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cast_members/1
  def update
    if @cast_member.update(cast_member_params)
      redirect_to @cast_member, notice: "Cast member was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cast_members/1
  def destroy
    @cast_member.destroy!
    redirect_to cast_members_path, notice: "Cast member was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast_member
      @cast_member = CastMember.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cast_member_params
      params.expect(cast_member: [ :cast_id, :person_id ])
    end
end
