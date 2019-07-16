class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @contacts = policy_scope(Contact).order(created_at: :desc)
  end

  def show
    set_contact
  end

  def update
    set_contact
    @contact.update(contact_params)
    redirect_to contact_path
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      flash[:success] = "We got your message, Our staff will contact you shortly"
      redirect_to tours_path
    else
      render new
    end
  end

  def destroy
    set_contact
    @contact.destroy

    redirect_to contacts_path
  end

  def set_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
