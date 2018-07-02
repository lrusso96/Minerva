require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support',
                                   'paths'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support',
                                   'selectors'))


module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When(/^(.*) within (.*[^:])$/) do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When(/^(.*) within (.*[^:]):$/) do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given(/^(?:|I )am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^(?:|I )follow "([^"]*)"$/) do |link|
  first(:link, link).click
  # click_link link
end

When(/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^(?:|I )fill in "([^"]*)" for "([^"]*)"$/) do |value, field|
  fill_in(field, with: value)
end

When(/^I attach a paper$/) do
  attach_file Rails.root.join('db/files/FakePaper.pdf')
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When(/^(?:|I )fill in the following:$/) do |fields|
  fields.rows_hash.each do |name, value|
    When %(I fill in "#{name}" with "#{value}")
  end
end

When(/^(?:|I )select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select(value, from: field)
end

When(/^(?:|I )check "([^"]*)"$/) do |field|
  check(field)
end

When(/^(?:|I )uncheck "([^"]*)"$/) do |field|
  uncheck(field)
end

When(/^(?:|I )choose "([^"]*)"$/) do |field|
  choose(field)
end

When(/^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/) do |path, field|
  attach_file(field, File.expand_path(path))
end

Then(/^(?:|I )should see-js "([^"]*)"$/) do |text|
  Capybara.ignore_hidden_elements = false
  if page.respond_to? :should
    expect(page).to have_content(text)
  else
    assert page.has_content?(text)
  end
  Capybara.ignore_hidden_elements = true
end

Then(/^(?:|I )should not see-js "([^"]*)"$/) do |text|
  Capybara.ignore_hidden_elements = false
  if page.respond_to? :should
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
  Capybara.ignore_hidden_elements = true
end

Then(/^(?:|I )should see "([^"]*)"$/) do |text|
  Capybara.ignore_hidden_elements = false
  if page.respond_to? :should
    expect(page).to have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then %r{/^(?:|I )should see \/([^\/]*)\/$/} do |regexp|
  regexp = Regexp.new(regexp)
  if page.respond_to? :should
    expect(page).to have_xpath('//*', text: regexp)
  else
    assert page.has_xpath?('//*', text: regexp)
  end
end

Then(/^(?:|I )should not see "([^"]*)"$/) do |text|
  if page.respond_to? :should
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end

end

Then %r{/^(?:|I )should not see \/([^\/]*)\/$/} do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    expect(page).to have_no_xpath('//*', text: regexp)
  else
    assert page.has_no_xpath?('//*', text: regexp)
  end
end

Then(/^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/) do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = field.tag_name == 'textarea' ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Then(/^the "([^"]*)" field(?: within (.*))? should not contain "([^"]*)"$/) do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = field.tag_name == 'textarea' ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then(/^the "([^"]*)" field should have the error "([^"]*)"$/) do |field, error_message|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')

  form_for_input = element.find(:xpath, 'ancestor::form[1]')
  using_formtastic = form_for_input[:class].include?('formtastic')
  error_class = using_formtastic ? 'error' : 'field_with_errors'

  if classes.respond_to? :should
    classes.should include(error_class)
  else
    assert classes.include?(error_class)
  end

  if page.respond_to?(:should)
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      expect(error_paragraph).to have_content(error_message)
    else
      expect(page).to have_content("#{field.titlecase} #{error_message}")
    end
  else
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      assert error_paragraph.has_content?(error_message)
    else
      assert page.has_content?("#{field.titlecase} #{error_message}")
    end
  end
end

Then(/^the "([^"]*)" field should have no error$/) do |field|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  if classes.respond_to? :should
    classes.should_not include('field_with_errors')
    classes.should_not include('error')
  else
    assert !classes.include?('field_with_errors')
    assert !classes.include?('error')
  end
end

Then(/^the "([^"]*)" checkbox(?: within (.*))? should be checked$/) do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      expect(field_checked).to be_true
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should not be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      expect(field_checked).to be_false
    else
      assert !field_checked
    end
  end
end

Then(/^(?:|I )should be on (.+)$/) do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    expect(current_path).to be == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then(/^(?:|I )should have the following query string:$/) do |exp_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  exp_pairs.rows_hash.each_pair { |k, v| expected_params[k] = v.split(',') }

  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then(/^show me the page$/) do
  save_and_open_page
end

# by class or id
When(/^(?:|I )click the "([^"]*)"$/) do |btn_stuff|
  find(btn_stuff).click
end

# CUSTOM

When(/^I open sidebar$/) do
  steps %(
    When I click the "#sidebarCollapse"
  )
end

When(/^I click new paper button$/) do
  steps %(
    When I click the ".btn-new-paper"
  )
end

When(/^I log out|He logs out$/) do
  steps %(
    Given I am on homepage
    When I click the ".btn-toggle-head"
    And I follow "Log out"
  )
end

Given(/^I am a registered user$/) do
  User.create!(name:  'Cocomero',
               surname: 'Registrato',
               email: 'cocomero@email.com',
               birthdate: Time.now.to_date - 20.year,
               password: 'foobar',
               password_confirmation: 'foobar')
end

When(/^I log in$/) do
  steps %(
    Given I am on log in page
    When I fill in "Email address" with "cocomero@email.com"
    And I fill in "Password" with "foobar"
    And I press "Log in"
  )
end

When(/^I upload a paper$/) do
  steps %(
    Given I am on homepage
    When I click new paper button
    Then I should be on upload paper page
    When I fill in "Title" with "Random title"
    And I fill in "Description" with "random Description"
    And I attach a paper
    And I press "Create paper"
    Then I should be on homepage
  )
end

Given(/^there is a registered user$/) do
  User.create!(name:  'Altro',
               surname: 'Cocomero',
               email: 'cocomero2@email.com',
               birthdate: Time.now.to_date - 20.year,
               password: 'foobar',
               password_confirmation: 'foobar')
end

When(/^He logs in$/) do
  steps %(
    Given I am on log in page
    When I fill in "Email address" with "cocomero2@email.com"
    And I fill in "Password" with "foobar"
    And I press "Log in"
  )
end

When(/^He follows me$/) do
  steps %(
    Given I am on users page
    When I follow "Cocomero Registrato"
    And I follow "Follow"
  )
end

When(/^He uploads a paper$/) do
  steps %(
    Given I am on homepage
    When I click new paper button
    Then I should be on upload paper page
    When I fill in "Title" with "Nice paper"
    And I fill in "Description" with "definitely not a description"
    And I attach a paper
    And I press "Create paper"
    Then I should be on homepage
  )
end
