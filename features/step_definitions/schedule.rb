When /^I access Gaucha schedule$/ do
    visit('https://gauchazh.clicrbs.com.br/programacao/')
    find('#sas_closeButonWrapper img').click()
end

When /^I click on (.*) in shedule nav$/ do |weekday|
    click_button(weekday);
end

Then /^I can see (.*) tv programs$/ do |length|
    expect(page).to have_selector('.event', count: length)
end