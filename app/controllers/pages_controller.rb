class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def add_service
    @service = Service.new
  end

  def book_service
    @services = Service.all
  end

end
