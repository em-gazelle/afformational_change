class AfformationsController < ApplicationController
  before_action :set_afformation, only: [:show, :edit, :update, :destroy]

  # GET /afformations
  # GET /afformations.json
  def index
    @afformations = Afformation.all
  end

  # GET /afformations/1
  # GET /afformations/1.json
  def show
  end

  # GET /afformations/new
  def new
    @afformation = Afformation.new
  end

  # GET /afformations/1/edit
  def edit
  end

  # POST /afformations
  # POST /afformations.json
  def create
    @afformation = Afformation.new(afformation_params)

    respond_to do |format|
      if @afformation.save
        format.html { redirect_to @afformation, notice: 'Afformation was successfully created.' }
        format.json { render :show, status: :created, location: @afformation }
      else
        format.html { render :new }
        format.json { render json: @afformation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /afformations/1
  # PATCH/PUT /afformations/1.json
  def update
    respond_to do |format|
      if @afformation.update(afformation_params)
        format.html { redirect_to @afformation, notice: 'Afformation was successfully updated.' }
        format.json { render :show, status: :ok, location: @afformation }
      else
        format.html { render :edit }
        format.json { render json: @afformation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /afformations/1
  # DELETE /afformations/1.json
  def destroy
    @afformation.destroy
    respond_to do |format|
      format.html { redirect_to afformations_url, notice: 'Afformation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_afformation
      @afformation = Afformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def afformation_params
      params.require(:afformation).permit(:afformation_text)
    end
end
