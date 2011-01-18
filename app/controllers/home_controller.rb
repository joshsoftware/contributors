class HomeController < ApplicationController
  # user defined method to redirect to home page after sign in/up
  def index
    respond_to do |format| 
      if user_signed_in?
        format.html #index.html.erb
      end
    end
  end

end
