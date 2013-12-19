# class ContactsController < ApplicationController

#   def process_form
#     Rails.logger.debug "DEBUG: params are #{params}"
#     flash[:notice] = "Received request from #{params[:contact][:name]}"
#     redirect_to root_path
#   end
# end

class ContactsController < ApplicationController

  def new
    @contact = Contact.new  # renders the new view
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      @contact.update_spreadsheet
      # TODO send message
      flash[:notice] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
  	#makes sure that params[:contact] only contains :name, :email, and :content
  	# before rails 4.0, this was done with strong parameters
    params.require(:contact).permit(:name, :email, :content) 
  end
end