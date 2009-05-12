Feature: Managing Games
  In order to keep track of all games bowled
  As a bowler
  I want to view, add, edit, and delete games

  Scenario: Viewing all games
    Given the following games exist:
      | rolls                                                 |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |
    And I am on the games index page
    Then I should see "Games"
    And I should see "New Game"
    And I should see the following:
      | rolls                                                 |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |

  Scenario: Adding a new game
    Given I am on the new game page
    When I fill in "Joined Rolls" with "2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3"
    And I press "Save"
    Then I should see "Games"
    And I should see "New Game"
    And I should see "2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3"
  
  
  