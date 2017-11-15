class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

	def new
	  @contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		respond_to do |format|
			if @contact.save
			  format.html { redirect_to @contact, notice: "Contact was Successfully Created."}
			  format.json { render json: index, status: :created, location: @contacts }
			else
				format.html { render action: 'new'}
				format.json { render json: @contact.errors, :status => "unprocessable entity"}
			end
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		respond_to do |format|
			if @conatct.update(contact_params)
				format.html {redirect_to @contact, notice: "Contact was updated Successfully"}
				format.json { render json: edit, status: :updated, location: @contacts }
			else
				format.html { render action: 'edit'}
				format.json { render json: @contact.errors, :status => "unprocessable entity"}
			end
		end
	end
  
  def destroy
  	@contact = Contact.find(params[:id])
  	@contact.destroy
  	redirect_to :back
  end

  private
  def contact_params
  	params.require(:contact).permit!
  end
end
