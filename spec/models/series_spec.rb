require 'spec_helper'

describe Series do
  it "has the name set correctly" do
    series = Series.new name:"Testi"

    series.name.should == "Testi"

  end


  it "is not saved without a name" do
    series = Series.create name:""

    expect(series).not_to be_valid
    expect(Series.count).to eq(0)

  end


  describe "with correct name" do

    let!(:series){FactoryGirl.create(:series)}

    it "is saved" do
      expect(series).to be_valid
      expect(Series.count).to eq(1)
    end


  end
end
