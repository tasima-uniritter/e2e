When /^I click on schedule$/ do
    find("[data-for='schedule']").click();
end

When /^I click on (.*) in shedule nav$/ do |weekday|
    within('.days-list') do
        click_button(weekday);
    end
end

Then /^I can see (.*) tv programs$/ do |length|
    expect(page).to have_selector('.event', count: length)
end