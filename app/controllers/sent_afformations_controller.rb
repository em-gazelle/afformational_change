class SentAfformationsController < ApplicationController
	before_action :set_sent_afformation, only: [:edit, :update]
	before_action :check_if_user_permitted_to_change_afformation, only: [:edit, :update]

	def index
		@sent_afformations = SentAfformation.where(user_id: current_user.id).unanswered_first
	end

	def edit
	end

	def update
	    respond_to do |format|
	      if @sent_afformation.update(sent_afformation_params)
	        format.html { redirect_to sent_afformations_url, notice: 'Afformation was succesfully updated with your response.' }
	        format.json { render :index, status: :ok, location: @sent_afformations }
	      else
	        format.html { render :edit }
	        format.json { render json: @sent_afformation.errors, status: :unprocessable_entity }
	      end
	    end				
	end

	private

	def sent_afformation_params
		params.require(:sent_afformation).permit(:user_response_to_afformation)
	end

	def set_sent_afformation
		@sent_afformation = SentAfformation.find(params[:id])
	end

    def check_if_user_permitted_to_change_afformation
      unless @sent_afformation.user_id == current_user.id
        handle_unauthorized_users
      end
    end

    def handle_unauthorized_users
      respond_to do |format|
        format.html { redirect_to sent_afformations_url, notice: 'You are not authorized to perform this action.' }
        format.json { render json: {}, status: :unauthorized }
      end   
    end

end
