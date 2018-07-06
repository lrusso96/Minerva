Feature: Profile / Following
As a LOGGED USER
I want to HAVE A PROFILE PAGE
so that I can SEE USERS I FOLLOW

@javascript
Scenario: simple follow
Given there is a registered user
Given I am a registered user
When I log in
Then I should be on homepage
Given I am on users page
When I follow "Altro Cocomero"
And I follow "Follow"
Given I am on homepage
When I open sidebar
And I follow "Following"
Then I should see "Altro Cocomero"
