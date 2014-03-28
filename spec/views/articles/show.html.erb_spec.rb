require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Abbreviation/)
    rendered.should match(/Author/)
    rendered.should match(/Title/)
    rendered.should match(/Journal/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Pages/)
    rendered.should match(/Publisher/)
    rendered.should match(/Address/)
    rendered.should match(/4/)
  end
end
