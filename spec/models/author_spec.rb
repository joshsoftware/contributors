require 'spec_helper'

describe "Authors" do

  context "should display all authors if" do

    it "user has LOGGED IN" do
    end

  end

  context "should not display all authors if" do

    it "user is not logged in" do
    end

  end

  context "should create new author if" do

    it "EMAIL field is NOT BLANK" do
    end

    it "EMAIL is VALID"do
    end

    it "EMAIL does  NOT EXIST" do
    end

    it "NAME is BLANK" do      
    end

  end

  ######### what is about author name

  context "should not create new author if" do

    it "EMAIL field is BLANK" do
    end

    it "EMAIL is NOT VALID" do
    end

    it "EMAIL is already EXIST" do
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
