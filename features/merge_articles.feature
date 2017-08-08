Feature: Merge Articles
	As a blog administrator
	In order to reduce redundancy
	I want to be able to merge Articles in my blog
	
    Background:
      Given the blog is set up
      Given there is an article with the title "article_1" and body "foobar" and author "Jeff" and id "1"
      And there is a comment with the article above and body 'Comment on Article 1'
      And there is an article with the title "article_2" and body "bazzbar" and author "Alison" and id "2"
      And there is a comment with the article above and body 'Comment on Article 2'
      And there is a user with the name 'nonadmin' and password 'somerandompassword'

      
    Scenario: A non-administrator cannot merge articles
      Given I am logged into the non-admin panel
      When I go to the edit page for "article_1"
      Then I should not see "Merge Articles"
      
    Scenario: When articles are merged, the merged article should contain the text of both previous articles.
       Given I am logged into the admin panel
       When I go to the edit page for "article_1"
       And I fill in "other_article_id" with "2"
       And I press "Merge"
       Then I should be on the edit page for "article_1"
       And I should see "foobar"
       And I should see "bazzbar"
       
    Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).
       Given I am logged into the admin panel
       When I go to the edit page for "article_1"
       And I fill in "other_article_id" with "2"
       And I press "Merge"
       Then I should be on the edit page for "article_1"
       Then I should see "Jeff"
       And I should not see "Alison"
       
    Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
       Given I am logged into the admin panel
       When I go to the edit page for "article_1"
       And I fill in "other_article_id" with "2"
       And I press "Merge"
       Then I should be on the edit page for "article_1"
       And I should see "Comment on Article 1"
       And I should see "Comment on Article 2"

    Scenario: The title of the new article should be the title from either one of the merged articles.
       Given I am logged into the admin panel
       When I go to the edit page for "article_1"
       And I fill in "other_article_id" with "2"
       And I press "Merge"
       Then I should be on the edit page for "article_1"
       Then I should see "article_1"
       And I should not see "article_2"      
      