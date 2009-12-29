Feature: Shrinking down
  In order to shrink some text
  A user passes input to fugu
  And gets a shorter version (if possible)
  
  Scenario: Simplest shrink
    Given the string "web1,web2" and delimiter ","
    When I shrink it
    Then I should get the string "web{1-2}"
  
  Scenario: Longer range shrink
    Given the string "web1,web2,web3" and delimiter ","
    When I shrink it
    Then I should get the string "web{1-3}"
  
  Scenario: Range with gap shrink
    Given the string "web1,web2,web4" and delimiter ","
    When I shrink it
    Then I should get the string "web{1-2,4}"
  
  Scenario: Range, gap, range, gap...
    Given the string "web1,web2,web9,web6,web7,web4" and delimiter ","
    When I shrink it
    Then I should get the string "web{1-2,4,6-7,9}"

  Scenario: zeros...
    Given the string "web01,web02,web12,web13,web14,web15" and delimiter ","
    When I shrink it
    Then I should get the string "web{01-02,12-15}"

  Scenario: Class method of shrink
    When I call shrink on Fugu with "web001,web002,web003" and delimiter ","
    Then I should have shrunk "web00{1-3}"

  #Scenario: Multiple shrinks
  #  Given the string "web1,web2,api3,api4" and delimiter ","
  #  When I shrink it
  #  Then I should get the string "web{1-2}|api{3-4}"