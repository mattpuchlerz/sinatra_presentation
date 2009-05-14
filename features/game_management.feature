Feature: Managing Games
  In order to keep track of all games bowled
  As a bowler
  I want to view, add, edit, and delete games

  Scenario: Viewing all games
    Given the following games exist:
      | hits                                                  |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |
    And I am on the games index page
    Then I should see "Games"
    And I should see 1 "New Game" link
    And I should see the following games:
      | hits                                                  | score |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 12    |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 14    |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    | 150   |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 | 300   |
    And I should see 4 "Show" links
    And I should see 4 "Edit" links
    And I should see 4 "Delete" buttons
    
  Scenario: Accessing the new game page
    Given I am on the games index page
    When I follow "New Game"
    Then I should be on the new game page
    And I should see "New Game"

  Scenario: Adding a new game
    Given I am on the new game page
    When I fill in "Hits" with "2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3"
    And I press "Save"
    Then I should be on the games show page
    And I should see "Game"
    And I should see "2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3"
  
  
  