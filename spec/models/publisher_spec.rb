require 'spec_helper'

describe Publisher do
  it "has the name set correctly" do
    publisher = Publisher.new name:"Testi"

    publisher.name.should == "Testi"

  end


  it "is not saved without a name" do
    publisher = Publisher.create name:""

    expect(publisher).not_to be_valid
    expect(Publisher.count).to eq(0)

  end


  describe "with correct name" do

    let!(:publisher){FactoryGirl.create(:publisher)}

    it "is saved" do
      expect(publisher).to be_valid
      expect(Publisher.count).to eq(1)
    end


  end
end
