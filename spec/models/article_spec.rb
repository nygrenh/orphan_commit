require 'spec_helper'

describe "Articles" do

  it "count is initially zero" do
    expect(Article.count).to eq(0)
  end
=begin

  it "has a sane string representation" do

    # pending

    article = FactoryGirl.create(:article)
    expect(article.to_s).to eq("Pekka. Pekan kuvakirja. Nykyaikaiset kuvakirjat, 5(3):2-5, 2013")
  end
=end

  describe "after adding one article" do


    it "correctly, count increases by one" do
      FactoryGirl.create(:article)
      expect(Article.count).to eq(1)
    end

    describe "(that is invalid)" do

      it "with a negative Volume, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.volume = -1
        artcl.save

        expect(Article.count).to eq(0)
      end

      it "with a Volume value of 0, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.volume = 0
        artcl.save

        expect(Article.count).to eq(0)
      end

      it "with a negative value for Number, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.number = -1
        artcl.save

        expect(Article.count).to eq(0)
      end

      it "with a Number value of 0, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.number = 0
        artcl.save

        expect(Article.count).to eq(0)
      end

      it "with negative Year, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.year = -1
        artcl.save

        expect(Article.count).to eq(0)
      end

      it "FROM THE FUTURE, count doesnt increase" do
        artcl = FactoryGirl.build(:article)
        artcl.year = Time.now.year + 1000
        artcl.save

        expect(Article.count).to eq(0)
      end

    end

  end

end

