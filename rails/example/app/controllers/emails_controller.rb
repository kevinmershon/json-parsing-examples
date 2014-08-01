class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create

    @email = Email.new(email_create_params)

  	# receivers contains both the to and cc values which have to be separated
    to_values = []
    cc_values = []
  	params.receivers.each do |element|
      if element.type == "to"
        to_values << element.address
      elsif element.type == "cc"
        cc_values << element.address
      end
  	end
  	@email.to = to_values.join ", "
  	@email.cc = cc_values.join ", "
    @email.save

    redirect_to email_path(@email)
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
