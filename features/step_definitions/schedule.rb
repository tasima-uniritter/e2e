Given /^I access Gaucha schedule$/ do
    visit('https://gauchazh.clicrbs.com.br/programacao/')
end

When /^I click on (.*) in shedule nav$/ do |weekday|
    click_button(weekday);
end

Then /^I can see (.*) tv programs$/ do |length|
    expect(page).to have_selector('.event', count: length)
end