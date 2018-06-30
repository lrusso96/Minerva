Feature: Paper / Delete
As a LOGGED USER
I want to HAVE PAPER PAGE
so that I can DELETE IT

Scenario: successfull reading
Given I am a registered user
When I log in
And I upload a paper
When I follow "Read more"
And I press "Delete this paper"
Given I am on homepage
Then I should not see-js "Random title"
