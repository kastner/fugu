Given /^the string "([^\"]*)"$/ do |arg1|
  @f = Fugu.new
  @f.text = arg1
end

When /^I puff it$/ do
  @message = "puff"
end

When /^I shrink it$/ do
  @message = "shrink"
end

Then /^I should get back "([^\"]*)"$/ do |arg1|
  assert_equal arg1, @f.send(@message)
end

When /^I really puff it$/ do
  @f.puff!
end

Then /^@text should be "([^\"]*)"$/ do |arg1|
  assert_equal arg1, @f.text
end
