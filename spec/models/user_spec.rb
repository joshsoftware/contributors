require 'spec_helper'

describe "User" do

  context "should be created if" do 

    it "all fields are filled (Email , Password , Password confirmation) " do
    end

    it "it does not contain EXISTING EMAIL " do
    end

    it "entries into Password and Confirm Password are SAME" do
    end

    it "EMAIL is VALID" do
    end

    it "LENGTH of password is in between 6-20" do
    end
  end

  context "should not be created if" do

    it "any field is EMPTY" do
    end

    it "it contains EXISTING EMAIL" do
    end

    it "entries into Password and Confirm Password are DIFFERENT" do
    end

    it "EMAIL is NOT VALID" do
    end

    it "LENGTH of password is less than 6 or greater than 20" do
    end
  end

  context "should start new session if" do

    it "email EXIST in user table" do
    end

    it "email and PASSWORD should MATCH" do
    end
  end

  context "should not start new session if" do

    it "EMAIL DOES NOT EXIST in user table" do
    end

    it "email and PASSWORD DOESN'T MATCH" do
    end
  end

  #### We can't implement because user has logged in with same email
#  context "should edit user's email" do

 #   it "" do
  #  end
  #end
  ##################################################

  describe "should edit user's password if" do

    it "same user has logged in " do
    end

    it "it MATCHES with OLD PASSWORD" do
    end

    ###########Duplicate

    it "LENGTH of password is in between 6-20" do
    end

    it "entries into PASSWORD and Confirm Password are MATCHES" do
    end
    ##########
  end

  context "should not edit user's password if" do 

    it "same user has NOT LOGGED IN" do
    end

    it " OLD PASSWORD DOES NOT MATCHED" do
    end

    it "LENGTH of password is less than 6 or greater than 20" do
    end

    it "entries into PASSWORD and Confirm Password are DIFFERENT" do
    end
  end
end
