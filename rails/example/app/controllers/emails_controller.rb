class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_create_params)
    @email.extract_json_values(params)
    @email.save
    
    redirectURL = email_url(@email)
    respond_to do |format|
      format.html { redirect_to redirectURL }
      format.json { render :json => { redirectURL: redirectURL } }
    end
  end

  def show
    if Email.exists?(:id => params[:id])
      @email = Email.find(params[:id])
    else
      flash[:error] = "That email does not exist."
      redirect_to root_url
    end
  end

  private

    def email_create_params
      params.permit(
        :subject,
        :body
      )
    end
end
