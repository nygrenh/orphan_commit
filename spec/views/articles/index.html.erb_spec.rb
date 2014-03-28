require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :abbreviation => "Abbreviation",
        :author => "Author",
        :title => "Title",
        :journal => "Journal",
        :volume => 1,
        :number => 2,
        :year => 3,
        :pages => "Pages",
        :publisher => "Publisher",
        :address => "Address",
        :user_id => 4
      ),
      stub_model(Article,
        :abbreviation => "Abbreviation",
        :author => "Author",
        :title => "Title",
        :journal => "Journal",
        :volume => 1,
        :number => 2,
        :year => 3,
        :pages => "Pages",
        :publisher => "Publisher",
        :address => "Address",
        :user_id => 4
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbreviation".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Journal".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Pages".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
