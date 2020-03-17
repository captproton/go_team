class BallotInitiativesController < ApplicationController
  before_action :set_ballot_initiative, only: [:show, :edit, :update, :destroy]

  # GET /ballot_initiatives
  # GET /ballot_initiatives.json
  def index
    @ballot_initiatives = BallotInitiative.all
  end

  # GET /ballot_initiatives/1
  # GET /ballot_initiatives/1.json
  def show
  end

  # GET /ballot_initiatives/new
  def new
    @ballot_initiative = BallotInitiative.new
  end

  # GET /ballot_initiatives/1/edit
  def edit
  end

  # POST /ballot_initiatives
  # POST /ballot_initiatives.json
  def create
    @ballot_initiative = BallotInitiative.new(ballot_initiative_params)

    respond_to do |format|
      if @ballot_initiative.save
        format.html { redirect_to @ballot_initiative, notice: 'Ballot initiative was successfully created.' }
        format.json { render :show, status: :created, location: @ballot_initiative }
      else
        format.html { render :new }
        format.json { render json: @ballot_initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballot_initiatives/1
  # PATCH/PUT /ballot_initiatives/1.json
  def update
    respond_to do |format|
      if @ballot_initiative.update(ballot_initiative_params)
        format.html { redirect_to @ballot_initiative, notice: 'Ballot initiative was successfully updated.' }
        format.json { render :show, status: :ok, location: @ballot_initiative }
      else
        format.html { render :edit }
        format.json { render json: @ballot_initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballot_initiatives/1
  # DELETE /ballot_initiatives/1.json
  def destroy
    @ballot_initiative.destroy
    respond_to do |format|
      format.html { redirect_to ballot_initiatives_url, notice: 'Ballot initiative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot_initiative
      @ballot_initiative = BallotInitiative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ballot_initiative_params
      params.require(:ballot_initiative).permit(:name, :team_id)
    end
end
