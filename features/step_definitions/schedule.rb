When /^I click on schedule$/ do
    find("[data-for='schedule']").click();
end

When /^I click on (.*) in shedule nav$/ do |weekday|
    click_button(weekday)
end

Then /^I can see (.*) radio programs$/ do |length|
    expect(page).to have_selector('.event', count: length)
end