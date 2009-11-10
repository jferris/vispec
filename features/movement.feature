Feature: move around the buffer

  Background:
    Given the following buffer:
      """
      First line
      Second line
      Third line
      Fourth line
      """
  Scenario: Use j and k
    When I press "jjjk"
    And I press "i"
    And I press "x<Esc>"
    Then line 3 should read "xThird line"

  Scenario: Use h and l
    When I press "lllh"
    And I press "i"
    And I press "x<Esc>"
    Then line 1 should read "Fixrst line"

