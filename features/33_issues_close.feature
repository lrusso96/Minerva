Feature: Issues / Close
As a LOGGED USER
I want to SEE A ISSUES PAGE
so that I can CLOSE THE ISSUE

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on simple paper page
When I follow "Issues"
Then I should be on simple paper's issues page
When I follow "New issue"
And I fill in "Title" with "titolo issue"
And I fill in "Insert here the description about issue." with "descrizione issue"
And I press "Create issue"
Given I am on simple paper's issues page
Then I should see "titolo issue"
When I follow "titolo issue"
And I follow "Close issue"
Given I am on simple paper's issues page
And I follow "Closed"
Then I should see "titolo issue"
