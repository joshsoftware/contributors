require 'spec_helper'
puts author = Factory.create(:author).name
describe "Authors" do

  context "should display all authors if" do

    it "user has LOGGED IN" do 
      user_signed_in?.should_not = nil
    end

  end

  context "should not display all authors if" do

    it "user is not logged in" 

  end

  context "should create new author if" do

    it "EMAIL field is NOT BLANK" 

    it "EMAIL is VALID"

    it "EMAIL does  NOT EXIST" 

    it "NAME is BLANK" 

  end

  ######### what is about author name

  context "should not create new author if" do

    it "EMAIL field is BLANK" 

    it "EMAIL is NOT VALID" 

    it "EMAIL is already EXIST" 

  end
end
########Author tables entries should not be edit
=begin
  context "should not edit the author entries" do

    it "should be restricted to edit any entry from Author table" do
    end
  end

=end

#####Can't remove entries from author table
=begin
context "should destroy author if"

    it "should not be allowed" do    
    end
  end
=end
