Feature: Puffing up
  In order to puff some text
  A user passes input to fugu
  And gets something useful out
  
  Scenario: Unexpandable text should come back as it went in
    Given the string "web0001"
    When I puff it
    Then I should get back "web0001"
    And @text should be "web0001"

  Scenario: Unexpandable Fugu expression comes back as it went in
    Given the string "web{0001}"
    When I puff it
    Then I should get back "web0001"
    And @text should be "web{0001}"
  
  Scenario: Simple expansion
    Given the string "web000{1,2}"
    When I puff it
    Then I should get back "web0001,web0002"

  Scenario: Range expanstion
    Given the string "web000{1-3}"
    When I puff it
    Then I should get back "web0001,web0002,web0003"

  Scenario: Simple Range expanstion
    Given the string "web{1-2}"
    When I puff it
    Then I should get back "web1,web2"

  Scenario: Mix of simple and complex ranges
    Given the string "web000{1,2-4,6}"
    When I puff it
    Then I should get back "web0001,web0002,web0003,web0004,web0006"

  Scenario: Simple two range expansion
    Given the string "web0001|api01"
    When I puff it
    Then I should get back "web0001,api01"

  Scenario: Complex two range expansion
    Given the string "web000{1-3}|api0{1-2}"
    When I puff it
    Then I should get back "web0001,web0002,web0003,api01,api02"

  Scenario: Doing a permanent expansion
    Given the string "web000{1-3}"
    When I really puff it
    Then @text should be "web0001,web0002,web0003"

  Scenario: Expansion with zeros
    Given the string "web{09-12}"
    When I puff it
    Then I should get back "web09,web10,web11,web12"

  Scenario: Class method puff
    When I call puff on Fugu with "web000{1-3}"
    Then I should have "web0001,web0002,web0003"
    
  Scenario: Puffing unpadded string always returns correct pad amount
    Given the string "web00{9-10}"
    When I puff it
    Then I should get back "web0009,web0010"