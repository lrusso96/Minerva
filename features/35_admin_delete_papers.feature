Feature: Admin / Delete papers
As an ADMIN
I want to HAVE SPECIAL SETTINGS
so that I can DELETE PAPERS

Scenario: successfull delete
Given there is a registered user
When He logs in
And He uploads a paper
And He logs out
Given I am an admin
When I log in as admin
Given I am on simple paper page
When I press "Delete this paper"
Given I am on users page
When I follow "Altro Cocomero"
Then I should not see "Nice paper"
