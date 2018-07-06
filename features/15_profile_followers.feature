Feature: Profile / Followers
As a LOGGED USER
I want to HAVE A PROFILE PAGE
so that I can SEE MY FOLLOWERS

@javascript
Scenario: simple follow
Given I am a registered user
Given there is a registered user
When He logs in
And He follows me
And He logs out
When I log in
Given I am on homepage
When I open sidebar
And I follow "Followers"
Then I should see "Altro Cocomero"
