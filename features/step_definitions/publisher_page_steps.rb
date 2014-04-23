begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

When(/^I go to the page that shows publisher's references$/) do
  visit publishers_path
  click_link("Publisher first")
end

