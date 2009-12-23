Given /^the string "([^\"]*)"$/ do |arg1|
  @f = Fugu.new
  @f.text = arg1
end

When /^I expand it$/ do
  @f.expand
end

Then /^I should get back "([^\"]*)"$/ do |arg1|
  assert_equal arg1, @f.text
end

