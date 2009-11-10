Given /^the following buffer:$/ do |contents|
  @vim.create_buffer(contents)
end

When /^I press "([^\"]*)"$/ do |key_sequence|
  @vim.press(key_sequence)
end

Then /^line (\d+) should read "([^\"]*)"$/ do |number, contents|
  @vim.line(number).should == contents
end

