class VisitorsController < ApplicationController
  def new
    @owner = Owner.new  # @owner is usable in view file because of @
    # there is hidden code from rails that also does:
    # render 'visitors/new'
  end
end