class ShareController < ApplicationController

    def index
        @user = current_user
        @attachments = @user.attachments.where(shared: true)
    end

    def create
        @user = current_user
        @attachment = Attachment.new(attachment_params)
    
        respond_to do |format|
          if @attachment.save
            format.html { redirect_to attachment_url(@attachment), notice: "Attachment was successfully created." }
            format.json { render :show, status: :created, location: @attachment }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @attachment.errors, status: :unprocessable_entity }
          end
        end
      end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      @user = User.find_by_email(params["email"])
      params.permit(:file).merge(user_id: @user.id, sharedBy: current_user.email, shared: true)
    end

end
