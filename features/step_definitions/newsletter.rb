When /^I click on submit in newsletter form$/ do
    find('.newsletter-submit-btn').click();
end

When /^I sign me up on newsletter with invalid email$/ do
    find('[name=EMAIL]').set('asd.com');
end

Then /^I can see error message inside newsletter box$/ do
    expect(page).to(have_css('.newsletter-email-error.error-show')) 
end