Feature: Settings / Nickname
As a LOGGED USER
I want to HAVE SETTINGS PAGE
so that I can CHANGE EMAIL

Scenario: successfull change
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I fill in "Email" with "nuova@email.com"
And I press "Save changes"
Then I should be on homepage
When I follow "Log out"
Given I am on log in page
When I fill in "Email address" with "cocomero@email.com"
And I fill in "Password" with "foobar"
And I press "Log in"
Then I should be on log in page
And I should not see "Log out"
When I fill in "Email address" with "nuova@email.com"
And I fill in "Password" with "foobar"
And I press "Log in"
Then I should see "Log out"
