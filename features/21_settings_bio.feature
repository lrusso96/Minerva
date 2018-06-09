Feature: Settings / Nickname
As a LOGGED USER
I want to HAVE SETTINGS PAGE
so that I can CHANGE BIO'S INFO

Scenario: successfull change
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I fill in "Name" with "NuovoNome"
And I fill in "Surname" with "NuovoCognome"
And I fill in "Current password" with "foobar"
And I press "Update"
Then I should be on homepage
When I follow "Profile"
Then I should see "NuovoNome"
And I should see "NuovoCognome"
