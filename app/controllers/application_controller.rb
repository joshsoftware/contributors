class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :except => :sign_up
  protect_from_forgery
end


