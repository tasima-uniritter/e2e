When /^I sign me up on newsletter with valid email$/ do
    find('[name=EMAIL]').set('asd@asd.com');
end

When /^I click on submit in newsletter form$/ do
    find('.newsletter-submit-btn').click();
end

When /^I choose one favorite content$/ do
    click_on('.newsletter-list-label', :match => :first)
end

When /^I sign me up on newsletter with invalid email$/ do
    find('[name=EMAIL]').set('asd.com');
end

Then /^I can see error message inside newsletter box$/ do
    expect(page).to(have_css('.newsletter-email-error.error-show')) 
end

Then /^I can see confirmation texts inside newsletter box$/ do
    expect(find('.newsletter-title')).to(have_content('Estamos quase lá!'))
end
