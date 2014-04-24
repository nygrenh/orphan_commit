require 'spec_helper'

describe Tag do
  it "has the name set correctly" do
    tag = Tag.new name:"Testi"

    tag.name.should == "Testi"

  end


  it "is not saved without a name" do
    tag = Tag.create name:""

    expect(tag).not_to be_valid
    expect(Tag.count).to eq(0)

  end


  describe "with correct name" do

    let!(:tag){FactoryGirl.create(:tag)}

    it "is saved" do
      expect(tag).to be_valid
      expect(Tag.count).to eq(1)
    end


  end
end
