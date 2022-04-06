class AttachmentsController < ApplicationController
  before_action :set_attachment, only: %i[ show edit update destroy ]

  # GET /attachments or /attachments.json
  def index
    @user = current_user
    @attachments = @user.attachments.where(shared: [nil, ""])
  end

  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1 or /attachments/1.json
  def show
    @user = current_user
    @attachment = set_attachment
  end

  # POST /attachments or /attachments.json
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

  # DELETE /attachments/1 or /attachments/1.json
  def destroy
    @user = current_user
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url, notice: "Attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      params.require(:attachment).permit(:file, :user_id)
    end
end
