module Api::V1  
  class AfformationsController < ApiController
    respond_to :json
    before_action :set_afformation, only: [:edit, :update, :destroy]
    before_action :check_if_user_permitted_to_change_afformation, only: [:destroy, :update]
    
    # GET /afformations
    # GET /afformations.json
    def index
      if current_user.admin?
        @afformations = Afformation.where(user_id: nil)
      else
        @afformations = current_user.afformations
      end

      render json: { afformations: @afformations, status: :ok }
    end

    # GET /afformations/new
    def new
      @afformation = Afformation.new
      render json: { afformation: @afformation, status: :ok }
    end

    # GET /afformations/1/edit
    def edit
    end

    # POST /afformations
    # POST /afformations.json
    def create
      @afformation = Afformation.new(afformation_params)
      @afformation.user_id = current_user.id if !current_user.admin?

      if @afformation.save
        render json: { afformation: @afformation, message: "Afformation successfully created", status: :created }
      else
        render json: { errors: @afformation.errors, status: :unprocessable_entity }
      end
    end

    # PATCH/PUT /afformations/1
    # PATCH/PUT /afformations/1.json
    def update
      if @afformation.update(afformation_params)
        render json: { afformation: @afformation, message: "Afformation successfully updated", status: :ok }
      else
        render json: { errors: @afformation.errors, message: "Afformation not updated", status: :unprocessable_entity }
      end
    end

    # DELETE /afformations/1
    # DELETE /afformations/1.json
    def destroy
      @afformation.destroy

      render json: { message: "Afformation successfully deleted", status: :ok }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_afformation
        @afformation = Afformation.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def afformation_params
        params.require(:afformation).permit(:afformation_text, :afformation_focus_area)
      end

      def check_if_user_permitted_to_change_afformation
        unless (@afformation.user_id.nil? && current_user.admin?) || (@afformation.user_id == current_user.id)
          handle_unauthorized_users
        end
      end

      def handle_unauthorized_users
        render json: { message: "Unauthorized user", status: :unauthorized }
      end   

  end
end