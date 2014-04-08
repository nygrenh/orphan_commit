require 'spec_helper'

describe Organization do
  it "has the name set correctly" do
    organization = Organization.new name:"Testi"

    organization.name.should == "Testi"

  end


  it "is not saved without a name" do
    organization = Organization.create name:""

    expect(organization).not_to be_valid
    expect(Organization.count).to eq(0)

  end


  describe "with correct name" do

    let!(:organization){FactoryGirl.create(:organization)}

    it "is saved" do
      expect(organization).to be_valid
      expect(Organization.count).to eq(1)
    end


  end
end
