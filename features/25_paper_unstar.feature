Feature: Paper / Unstar
As a LOGGED USER
I want to SEE PAPER PAGE
so that I can UNSTAR IT

Scenario: simple
Given there is a registered user
When He logs in
And He uploads a paper
And He logs out
Given I am a registered user
When I log in
Given I am on simple paper page
When I follow "Star paper"
Given I am on homepage
When I follow "Papermark"
Then I should be on homepage
And I should see-js "Nice paper"
Given I am on simple paper page
When I follow "Unstar it"
Given I am on homepage
When I follow "Papermark"
Then I should be on homepage
And I should not see-js "Nice paper"
