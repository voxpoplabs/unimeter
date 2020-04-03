class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
    	@contact.send_contact_email
     	flash[:notice] = 'Thank you for your message!'
     	render :new
    else
        puts  @contact.errors.full_messages.to_s
      	flash[:notice] = 'Cannot send message.' +  @contact.errors.full_messages.to_s
      	render :new
    end
  end


	private

	def contact_params
		params.require(:contact).permit(:name, :email, :description, :nickname)
	end

end