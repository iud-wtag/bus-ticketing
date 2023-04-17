class HomeController < ApplicationController
  def index
    before_action :authenticate_user!
    load_and_authorize_resource
  end
end
