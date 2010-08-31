require 'gappster'

class HomeController < ApplicationController

  authenticate_with_google 'crowdint.com'

  WELCOME_MESSAGE = 'Welcome home'

  def index
    render :text => WELCOME_MESSAGE
  end 

end
