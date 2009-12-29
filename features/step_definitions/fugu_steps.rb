Given /^the string "([^\"]*)" and delimiter "([^\"]*)"$/ do |arg1, arg2|
  @f = Fugu.new
  @f.text = arg1
  @f.delimiter = arg2
end

When /^I puff it$/ do
  @message = "puff"
end

When /^I shrink it$/ do
  @message = "shrink"
end

Then /^I should get back "([^\"]*)"$/ do |arg1|
  assert_equal arg1, @f.send(@message).join(",")
end

Then /^I should get the string "([^\"]*)"$/ do |arg1|
  assert_equal arg1, @f.send(@message)
end

When /^I really puff it$/ do
  @f.puff!
end

Then /^@text should be "([^\"]*)"$/ do |arg1|
  # assert_equal arg1, @f.send().join(',')
end

When /^I call puff on Fugu with "([^\"]*)"$/ do |arg1|
  @string = arg1
end

Then /^I should have "([^\"]*)"$/ do |arg1|
  assert_equal arg1, Fugu.puff(@string).join(',')
end

When /^I call shrink on Fugu with "([^\"]*)" and delimiter "([^\"]*)"$/ do |arg1, arg2|
  @string = arg1
  @delimiter = arg2
end

Then /^I should have shrunk "([^\"]*)"$/ do |arg1|
  assert_equal arg1, Fugu.shrink(@string, @delimiter)
end