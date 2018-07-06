Feature: Paper / Unstar
As a LOGGED USER
I want to SEE PAPER PAGE
so that I can UNSTAR IT

@javascript
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
When I open sidebar
And I follow "Papermark"
Then I should see "Nice paper"
Given I am on simple paper page
When I follow "Unstar it"
Given I am on homepage
When I open sidebar
And I follow "Papermark"
Then I should not see "Nice paper"
