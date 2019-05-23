class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]
  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    authorize @contact
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your messase. We will contact you soon!'

      else
        flash.now[:error] = 'Cannot sen message'
        render :new
      end
  end
end
