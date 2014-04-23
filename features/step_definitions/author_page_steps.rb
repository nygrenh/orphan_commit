begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

When(/^I go to the page that shows author's references$/) do
  visit authors_path
  click_link("P. Parsa")
end