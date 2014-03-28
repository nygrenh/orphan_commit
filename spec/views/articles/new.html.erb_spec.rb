require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :abbreviation => "MyString",
      :author => "MyString",
      :title => "MyString",
      :journal => "MyString",
      :volume => 1,
      :number => 1,
      :year => 1,
      :pages => "MyString",
      :publisher => "MyString",
      :address => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "input#article_abbreviation[name=?]", "article[abbreviation]"
      assert_select "input#article_author[name=?]", "article[author]"
      assert_select "input#article_title[name=?]", "article[title]"
      assert_select "input#article_journal[name=?]", "article[journal]"
      assert_select "input#article_volume[name=?]", "article[volume]"
      assert_select "input#article_number[name=?]", "article[number]"
      assert_select "input#article_year[name=?]", "article[year]"
      assert_select "input#article_pages[name=?]", "article[pages]"
      assert_select "input#article_publisher[name=?]", "article[publisher]"
      assert_select "input#article_address[name=?]", "article[address]"
      assert_select "input#article_user_id[name=?]", "article[user_id]"
    end
  end
end
