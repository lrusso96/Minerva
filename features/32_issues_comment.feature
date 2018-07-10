Feature: Issues / Comment
As a LOGGED USER
I want to SEE A ISSUES PAGE
so that I can COMMENT ISSUE

@javascript
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
And I follow "Reply"
Then I should be on simple comment page
When I comment with "commento semplice"
And I press "Create comment"
Given I am on simple paper's issues page
Then I should see "titolo issue"
When I follow "titolo issue"
Then I should see "commento semplice"
