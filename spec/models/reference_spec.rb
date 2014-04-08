require 'spec_helper'

describe Reference do
  it "has the attributes set correctly if type book" do
    reference = Reference.new title:"Testi", year:2014,volume:205,
                              edition: "1.", number:4, series_id: 1,
                              month: 4, note: "Testinote",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Book"

    reference.title.should == "Testi"
    reference.year.should == 2014
    reference.volume.should == 205
    reference.edition.should == "1."
    reference.number.should == 4
    reference.series_id.should == 1
    reference.month.should == 4
    reference.note.should == "Testinote"
    reference.address.should == "Osoite 1"
    reference.key.should == "Avain1"
    reference.publisher_id.should == 4
    reference.reference_type.should == "Book"


  end

  describe "with correct attributes for book" do

    let!(:reference_book){FactoryGirl.create(:reference_book)}

    it "book is saved" do
      expect(reference_book).to be_valid
      expect(Reference.count).to eq(1)
    end

  end



  it "has the attributes set correctly if type inproceeding" do
    reference = Reference.new title:"Testi", year:2014,volume:205,
                              number:4, series_id: 1, organization_id: 4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1", booktitle: "Otsikko",
                              key: "Avain1", publisher_id: 4, reference_type: "Inproceeding"

    reference.title.should == "Testi"
    reference.booktitle.should == "Otsikko"
    reference.pages.should == "125--587"
    reference.year.should == 2014
    reference.volume.should == 205
    reference.number.should == 4
    reference.series_id.should == 1
    reference.organization_id.should == 4
    reference.month.should == 4
    reference.note.should == "Testinote"
    reference.address.should == "Osoite 1"
    reference.key.should == "Avain1"
    reference.publisher_id.should == 4
    reference.reference_type.should == "Inproceeding"


  end


  describe "with correct attributes for inproceeding" do

    let!(:reference_inproceeding){FactoryGirl.create(:reference_inproceeding)}

    it "inproceeding is saved" do
      expect(reference_inproceeding).to be_valid
      expect(Reference.count).to eq(1)
    end

  end




  it "has the attributes set correctly if type article" do
    reference = Reference.new title:"Testi", year:2014, journal_id: 5, volume:205,
                              number:4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Article"

    reference.title.should == "Testi"
    reference.journal_id.should == 5
    reference.pages.should == "125--587"
    reference.year.should == 2014
    reference.volume.should == 205
    reference.number.should == 4
    reference.month.should == 4
    reference.note.should == "Testinote"
    reference.address.should == "Osoite 1"
    reference.key.should == "Avain1"
    reference.publisher_id.should == 4
    reference.reference_type.should == "Article"


  end

  describe "with correct attributes for article" do

    let!(:reference_article){FactoryGirl.create(:reference_article)}

    it "article is saved" do
      expect(reference_article).to be_valid
      expect(Reference.count).to eq(1)
    end

  end



  it "book not saved without a title" do
    reference = Reference.create title:"", year:2014,volume:205,
                              edition: "1.", number:4, series_id: 1,
                              month: 4, note: "Testinote",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Book"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "book not saved without a year" do
    reference = Reference.create title:"Title",volume:205,
                              edition: "1.", number:4, series_id: 1,
                              month: 4, note: "Testinote",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Book"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "book not saved without a publisher" do
    reference = Reference.create title:"Title",volume:205,
                              edition: "1.", number:4, series_id: 1,
                              month: 4, note: "Testinote",
                              address: "Osoite 1",
                              key: "Avain1", year: 2014, reference_type: "Book"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "inproceeding not saved without a title" do
    reference = Reference.create title:"", year:2014,volume:205,
                              number:4, series_id: 1, organization_id: 4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1", booktitle: "Otsikko",
                              key: "Avain1", publisher_id: 4, reference_type: "Inproceeding"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "inproceeding not saved without a year" do
    reference = Reference.create title:"Title", volume:205,
                              number:4, series_id: 1, organization_id: 4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1", booktitle: "Otsikko",
                              key: "Avain1", publisher_id: 4, reference_type: "Inproceeding"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "inproceeding not saved without a booktitle" do
    reference = Reference.create title:"Title", year:2014,volume:205,
                              number:4, series_id: 1, organization_id: 4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1", booktitle: "",
                              key: "Avain1", publisher_id: 4, reference_type: "Inproceeding"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "article not saved without a title" do
    reference = Reference.create title:"", year:2014, journal_id: 5, volume:205,
                              number:4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Article"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "article not saved without a year" do
    reference = Reference.create title:"Testi", journal_id: 5, volume:205,
                              number:4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Article"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end

  it "article not saved without a journal" do
    reference = Reference.create title:"Testi", year: 2201, volume:205,
                              number:4,
                              month: 4, note: "Testinote", pages: "125--587",
                              address: "Osoite 1",
                              key: "Avain1", publisher_id: 4, reference_type: "Article"

    expect(reference).not_to be_valid
    expect(Reference.count).to eq(0)

  end



end
