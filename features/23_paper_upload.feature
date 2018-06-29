Feature: Paper / Upload
As a LOGGED USER
I want to HAVE A PAPER PAGE
so that I can UPLOAD A PAPER

Scenario: successfull upload
Given I am a registered user
When I log in
And I upload a paper
Then I should see "Random title"

Scenario: unsuccessfull upload without file
Given I am a registered user
When I log in
Then I should be on homepage
When I click by class ".btn-new-paper"
Then I should be on upload paper page
When I fill in "Title" with "Random title"
And I fill in "Description" with "random Description"
And I press "Create paper"
Then I should not see "Random title"
