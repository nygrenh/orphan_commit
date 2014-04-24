require 'spec_helper'

describe ReferenceTag do
  it "has the ids set correctly" do


    reference_author = ReferenceTag.new reference_id: 1, tag_id:5

    reference_author.reference_id.should eq(1)
    reference_author.tag_id.should eq(5)

  end

  describe "with correct ids" do

    let!(:reference_tag){FactoryGirl.create(:reference_tag)}

    it "is saved" do
      expect(reference_tag).to be_valid
      expect(ReferenceTag.count).to eq(1)
    end


  end
end
