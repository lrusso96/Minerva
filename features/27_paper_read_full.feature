Feature: Paper / Read full
As a LOGGED USER
I want to SEE PAPER PAGE
so that I can READ THE FULL PAPER

Scenario: successfull reading
Given I am a registered user
When I log in
And I upload a paper
Then I should see "Read article"
