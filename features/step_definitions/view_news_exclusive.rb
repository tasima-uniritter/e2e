When /^I click on a exclusive news$/ do
    page.find('.columnist-highlight a').click
end

Then /^I should see "(.*?)" exclusive page validation$/ do |content|
    expect(page).to have_content(content)
end