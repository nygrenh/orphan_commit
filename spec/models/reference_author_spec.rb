require 'spec_helper'

describe ReferenceAuthor do
  it "has the ids set correctly" do


    reference_author = ReferenceAuthor.new author_id: 1, reference_id:5

    reference_author.author_id.should eq(1)
    reference_author.reference_id.should eq(5)

  end

  describe "with correct ids" do

    let!(:reference_author){FactoryGirl.create(:reference_author)}

    it "is saved" do
      expect(reference_author).to be_valid
      expect(ReferenceAuthor.count).to eq(1)
    end


  end
end
