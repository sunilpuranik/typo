Feature: Add or Edit Categories
  As a blog administrator
  In order to group my articles
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create a category
    Given I am on the new category page
    When I fill in "category_name" with "Foobar"
    And I press "Save"
    Then I should be on the new category page
    Then I should see "Foobar"

  Scenario: Succesfully edit a category
    Given I am on the new category page
      And I should see "General"
    When I follow "General"
    Then I fill in "Description" with "Foobarbar"
    And I press "Save"
    Then I should see "Foobarbar"




