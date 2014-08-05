class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create

    @email = Email.new(email_create_params)

    # receivers contains both the to and cc values which have to be separated
    to_values = []
    cc_values = []
    receivers_list = JSON.parse(params["receivers"])
    receivers_list.each do |element|
      if element["type"] == "to"
        to_values << element["address"]
      elsif element["type"] == "cc"
        cc_values << element["address"]
      end
    end
    @email.to = to_values.join ", "
    @email.cc = cc_values.join ", "
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
