class WelcomeController < ApplicationController
  def index
  end

  def contact
    ContactMailer.contact_form(params[:name], params[:email], params[:phone], params[:question]).deliver_now

    redirect_to root_path, notice: "Great!  We will get back to you shortly."
  end

end
