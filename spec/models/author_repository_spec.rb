require 'spec_helper'

describe "AuthorRepository" do

  context "should be created if" do

    it "Author is exist in Author table" 

    it "Repository is exist in Repository table" 

    it "Pair of given Author and Repository is exist in GitLog table " 

  end


  #########################################
  context "should not be created if" do

    it "given author is not exist in Author table" 

    it "given repository is not exist in Repository table" 

    it "pair of given author and repository is not exist in GitLog table " 
  end


  #describe "Edit AuthorRepository" do
  #it "User can not edit AuthorRespository" do
  #  end
  #end

  context "should be destroy if" do

    it "the related repository get removed from Repository table " 

  end

  context "should not be destroy" do

    it "GitLog contains its entry" 

  end

end
