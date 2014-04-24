begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

When(/^I go to the page that shows journal's references$/) do
  visit journals_path
  click_link("Best Journal")
end

Given(/^two article references have been added$/) do

  create_article_reference("Best article", 2014, 'P. Parsa')
  create_article_reference("Best article2", 2014, 'P. Parsa')

end