require 'spec_helper'

describe "Repository" do

  context "should create repository if" do

    it "URL is NOT BLANK" 

    it "USER_ID is NOT BLANK" 

    it "URL is not EXIST" 

  end

  context "should not be create repository if" do

    it "URL is BLANK" 

    it "USER_ID is BLANK" 

    it "URL is already EXIST" 

  end


  # describe "Edit Repository" do
  #   it "It should not allow to edit url" do
  # end
  # end

  context "should be destroy if" do

    it "only owner has logged in i.e. current_user_id get match with the owner's id" 

  end

  context "should be shown all repositories if" do

    it "user has LOGGED IN" 

  end

  context "should not be shown all repositories if" do

    it "user is not logged in" 

  end

end
