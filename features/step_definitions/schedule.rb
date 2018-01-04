weekdays = {
    "SEG" => "/html/body/div[1]/div/div[4]/div/div/div/div/section[1]/div/nav[1]/ul/li[5]/button",
}

When /^I click on schedule$/ do
    find("[data-for='schedule']").click();
end

When /^I click on (.*) in shedule nav$/ do |weekday|
    find(:xpath, weekdays[weekday]).click();
end

Then /^I can see (.*) tv programs$/ do |length|
    expect(page).to have_selector('.event', count: length)
end