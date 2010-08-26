require 'gappster'

class HomeController < ApplicationController

  openid_auth 'crowdint.com'

  WELCOME_MESSAGE = 'Welcome home'

  def index
    render :text => WELCOME_MESSAGE
  end 

end
