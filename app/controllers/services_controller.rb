class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def my
      @services = current_user.services
  end

end
