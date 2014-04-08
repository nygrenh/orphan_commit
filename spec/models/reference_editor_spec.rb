require 'spec_helper'

describe ReferenceEditor do
  it "has the ids set correctly" do


    reference_editor = ReferenceEditor.new author_id: 1, reference_id: 5

    reference_editor.author_id.should eq(1)
    reference_editor.reference_id.should eq(5)

  end

  describe "with correct ids" do

    let!(:reference_editor){FactoryGirl.create(:reference_editor)}

    it "is saved" do
      expect(reference_editor).to be_valid
      expect(ReferenceEditor.count).to eq(1)
    end


  end
end
