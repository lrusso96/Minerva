Feature: Profile / Top papers
As a LOGGED USER
I want to SEE PROFILE PAGE OF OTHER USER
so that I can FIND HIS TOP PAPERS

Scenario: basic
Given there is a registered user
When He logs in
And He uploads a paper
And He logs out
Given I am a registered user
When I log in
Given I am on users page
When I follow "Altro Cocomero"
Then I should see "Nice paper"
