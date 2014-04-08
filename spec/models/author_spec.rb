require 'spec_helper'

describe Author do
  it "has the name set correctly" do
    author = Author.new name:"Testi"

    author.name.should == "Testi"

  end


  it "is not saved without a name" do
    author = Author.create name:""

    expect(author).not_to be_valid
    expect(Author.count).to eq(0)

  end


  describe "with correct name" do

    let!(:author){FactoryGirl.create(:author)}

    it "is saved" do
      expect(author).to be_valid
      expect(Author.count).to eq(1)
    end


  end
end
