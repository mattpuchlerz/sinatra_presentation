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
    
  Scenario: Accessing the show game page
    Given the following games exist:
      | hits                                             |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0 |
    And I am on the games index page
    When I follow "Show"
    Then I should be on the show game page
    And I should see "Game"
    And I should see 1 "Back to Games" link
    And I should see 1 "Edit Game" link
    And I should see "5,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
    And I should see "12"
  
  Scenario: Accessing the new game page
    Given I am on the games index page
    When I follow "New Game"
    Then I should be on the new game page
    And I should see "New Game"
    And I should see 1 "Back to Games" link

  Scenario: Adding a new game
    Given I am on the new game page
    When I fill in "Hits" with "5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5"
    And I press "Save"
    Then I should be on the show game page
    And I should see "5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5"
    And I should see "150"
  
  Scenario: Accessing the game edit page
    Given the following games exist:
      | hits                                             |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0 |
    And I am on the games index page
    When I follow "Edit"
    Then I should be on the edit game page
    And I should see "Edit Game"
    And I should see 1 "Back to Games" link
    And I should see 1 "Show Game" link
    And the "Hits" field should contain "5,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
    And I should see 1 "Save" button
  
  Scenario: Editing a game
  Given the following games exist:
    | hits                                             |
    | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0 |
  And I am on the edit game page
  When I fill in "Hits" with "5,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
  And I press "Save"
  Then I should be on the show game page
  And I should see "5,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
  And I should see "13"
  
  Scenario: Deleting a game
  Given the following games exist:
    | hits                                                  |
    | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
    | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
    | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
    | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |
  And I am on the games index page
  When I press "Delete"
  Then I should be on the games index page
  And I should see the following games:
    | hits                                                  | score |
    | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 14    |
    | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    | 150   |
    | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 | 300   |
  And I should see 3 "Show" links
  And I should see 3 "Edit" links
  And I should see 3 "Delete" buttons