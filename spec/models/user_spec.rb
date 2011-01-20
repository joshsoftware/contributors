require 'spec_helper'
 puts user = Factory.create(:user)
describe "User" do

  context "should be created if" do 

    it "all fields are filled (Email , Password , Password confirmation) " 

    it "it does not contain EXISTING EMAIL "

    it "entries into Password and Confirm Password are SAME" 

    it "EMAIL is VALID" 

    it "LENGTH of password is in between 6-20"

  end

  context "should not be created if" do

    it "any field is EMPTY"

    it "it contains EXISTING EMAIL" 

    it "entries into Password and Confirm Password are DIFFERENT" 

    it "EMAIL is NOT VALID" 

    it "LENGTH of password is less than 6 or greater than 20" 
  end

  context "should start new session if" do

    it "email EXIST in user table"

    it "email and PASSWORD should MATCH" 
  end

  context "should not start new session if" do

    it "EMAIL DOES NOT EXIST in user table"

    it "email and PASSWORD DOESN'T MATCH" 
  end

  #### We can't implement because user has logged in with same email
#  context "should edit user's email" do

 #   it "" do
  #  end
  #end
  ##################################################

  describe "should edit user's password if" do

    it "same user has logged in " 

    it "it MATCHES with OLD PASSWORD" 

    it "LENGTH of password is in between 6-20" 

    it "entries into PASSWORD and Confirm Password are MATCHES" 
  end

  context "should not edit user's password if" do 

    it "same user has NOT LOGGED IN" 

    it " OLD PASSWORD DOES NOT MATCHED" 

    it "LENGTH of password is less than 6 or greater than 20" 

    it "entries into PASSWORD and Confirm Password are DIFFERENT" 
  end
end
