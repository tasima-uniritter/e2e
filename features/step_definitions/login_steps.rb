Given /^I access Gaucha$/ do
    visit('https://gauchazh.clicrbs.com.br/')

    if (page.has_css?('#sas_closeButonWrapper img'))
        find('#sas_closeButonWrapper img').click()
    end
end

When /^I sigin with a valid user$/ do
    find('.login-button').click()
    find('[name=username]').set('uniritterfapa')
    find('[name=password]').set('1003DC')
    find('.form-login [type=submit]').click()
end

When /^I click on logout$/ do
    find('.logout-txt').click()
end

Then /^I should see "(.*?)" in login sidebar$/ do |name|
    expect(find('.box-userinfos-name')).to(have_content(name))
end

Then /^I shouldn't see user name in login sidebar$/ do
    expect(page).not_to(have_selector('.box-userinfos-name'))
end
