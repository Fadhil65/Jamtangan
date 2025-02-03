*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          ../data/data.robot    #login_data.robot Import data dari login_data.robot
Resource          ../resources/keywords.robot

*** Test Cases ***

Login page
    Given I Open jamtangan
    And click menu masuk
    Then I input credentials account
    
Search Product
    Then I search Presage
    And click button add to cart
    Then click icon cart
