require 'spec_helper'

describe Journal do
  it "has the name set correctly" do
    journal = Journal.new name:"Testi"

    journal.name.should == "Testi"

  end


  it "is not saved without a name" do
    journal = Journal.create name:""

    expect(journal).not_to be_valid
    expect(Journal.count).to eq(0)

  end


  describe "with correct name" do

    let!(:journal){FactoryGirl.create(:journal)}

    it "is saved" do
      expect(journal).to be_valid
      expect(Journal.count).to eq(1)
    end


  end
end
