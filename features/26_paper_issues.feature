Feature: Paper / Issues
As a LOGGED USER
I want to SEE PAPER PAGE
so that I can SEE ITS ISSUES

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on simple paper page
When I follow "Issues"
Then I should be on simple paper's issues page
