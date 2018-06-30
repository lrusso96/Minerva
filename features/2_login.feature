Feature: Log in
As a REGISTERED USER
I want to LOG IN
so that I can JOIN THE SYSTEM

Scenario: Unsuccesfull log in due to not registered account
When I log in
Then I should not see "Log out"

Scenario: Unsuccesfull log in due to wrong password
Given I am a registered user
And I am on log in page
When I fill in "Email address" with "cocomero@email.com"
And I fill in "Password" with "foobar_wrong"
And I press "Log in"
Then I should be on log in page
And I should not see "Log out"

Scenario: Succesfull log in
Given I am a registered user
When I log in
Then I should see "Log out"
