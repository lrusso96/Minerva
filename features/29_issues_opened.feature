Feature: Issues / Opened issues
As a LOGGED USER
I want to SEE A ISSUES PAGE
so that I can SEE THE OPENED ISSUES

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on simple paper page
When I follow "Issues"
Then I should be on simple paper's issues page
