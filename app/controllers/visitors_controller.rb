class VisitorsController < ApplicationController
  def new
    @owner = Owner.new  # @owner is usable in view file because of @
    # there is hidden code from rails that also does:
    # render 'visitors/new'
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'My birthday is soon.'
  end
end