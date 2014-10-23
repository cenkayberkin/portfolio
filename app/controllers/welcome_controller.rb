class WelcomeController < ApplicationController
  def index
  end

  def new_contact
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    binding.pry
  end

end
