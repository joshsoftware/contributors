require 'spec_helper'

describe "Gitlog" do

  context "should be created if" do

    it "Sha is not blank" 

    it "Author is not blank" 

    it "Repository is not blank" 

    it "Date is not blank" 

    it "Author is exist in Author table" 

    it "Repository is exist in Repository table" 

    it "Date is valid" 

    it "Sha is unique" 
  end


  context "should not be created if" do

    it "Sha is blank" 

    it "Author is blank" 

    it "Repository is blank" 

    it "Date is blank" 

    it "Author does not exist in Author table" 

    it "Repository does not exist in Repository table" 

    it "Date is not valid" 

    it "Sha is already exist" 
  end


  context "if author is G then user should see" do 

    it "2 entries if :from, :to, :repostiory, is empty" 

    it "1 entry if :from is SELECTED and :to is empty and :repository is empty" 

    it "b no. of entries if :from is empty, :to is SELECTED and :repository is empty " 

    it "c no. of entries if :from is empty, :to is empty and :repository is SELECTED" 

    it "d no. of entries if :from is SELECTED, :to is SELECTED and :repository is empty" 

    it "e no. of entries if :from is SELECTED, :to is empty and :repository is SELECTED" 

    it "f no. of entries if :from is empty, :to is SELECTED and :repository is SELECTED" 

    it "g no. of entries if :from is SELECTED, :to is SELECTED and :repository is SELECTED" 

  end

  context "if repository is R2 then user should see" do

    it "2 entries if :from, :to, :author, is empty" 

    it "1 entry if :from is SELECTED and :to is empty and :author is empty" 

    it "b no. of entries if :from is empty, :to is SELECTED and :author is empty "  

    it "c no. of entries if :from is empty, :to is empty and :author is SELECTED" 

    it "d no. of entries if :from is SELECTED, :to is SELECTED and :author is empty" 

    it "e no. of entries if :from is SELECTED, :to is empty and :author is SELECTED" 

    it "f no. of entries if :from is empty, :to is SELECTED and :author is SELECTED" 

    it "g no. of entries if :from is SELECTED, :to is SELECTED and :author is SELECTED" 

  end


  context "should not be display any entry if"  do

    it "User is not logged in" 

  end

  #describe "Edit or destroy Gitlog" do
  # it "User can not edit or destroy anythng from GitLog directly" do
  #end
  #end


  context "should be destroy if" do

    it "perticular repository get destroy from Repository table" 

  end

  context "should not get destroy if" do

    it "it has entry in that repository" 

  end

end
