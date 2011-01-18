require 'spec_helper'

describe "Repository" do

  context "should create repository if" do

    it "URL is NOT BLANK" do
    end

    it "USER_ID is NOT BLANK" do
    end

    it "URL is not EXIST" do
    end

  end

  context "should not be create repository if" do

    it "URL is BLANK" do 
    end

    it "USER_ID is BLANK" do
    end

    it "URL is already EXIST" do
    end

  end


  # describe "Edit Repository" do
  #   it "It should not allow to edit url" do
  # end
  # end

  context "should be destroy if" do

    it "only owner has logged in i.e. current_user_id get match with the owner's id" do 
    end

  end

  context "should be shown all repositories if" do

    it "user has LOGGED IN" do
    end

  end

  context "should not be shown all repositories if" do

    it "user is not logged in" do
    end

  end

end
