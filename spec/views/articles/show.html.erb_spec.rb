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

  end
end
