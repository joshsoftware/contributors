require 'spec_helper'

describe "Gitlog" do

  context "should be created if" do

    it "Sha is not blank" do
    end

    it "Author is not blank" do
    end

    it "Repository is not blank" do
    end

    it "Date is not blank" do
    end

    it "Author is exist in Author table" do
    end

    it "Repository is exist in Repository table" do
    end

    it "Date is valid" do
    end

    it "Sha is unique" do
    end
  end


  context "should not be created if" do

    it "Sha is blank" do
    end

    it "Author is blank" do
    end

    it "Repository is blank" do
    end

    it "Date is blank" do
    end

    it "Author does not exist in Author table" do
    end

    it "Repository does not exist in Repository table" do
    end

    it "Date is not valid" do
    end

    it "Sha is already exist" do
    end
  end


  #describe "Create Gitlog" do
  # it "Pair of author and repository should exist in AuthorRepository table" do
  #end
  #end

  context "should be display all entries if" do 

    it "User ask" do 
    end

  end

  context "should not be display all entries if"  do

    it "User is not logged in" do
    end

  end
  #describe "Edit ro destroy Gitlog" do
  # it "User can not edit or destroy anythng from GitLog directly" do
  #end
  #end


  context "should be destroy if" do

    it "perticular repository get destroy from Repository table" do
    end

  end

end
