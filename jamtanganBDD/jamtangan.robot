*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://jamtangan.com

*** Test Cases ***
Login page
    Given I Open jamtangan
    And click menu masuk
    Then Then I input credentials account
    And And I click button login
    
Search Product
    Then I search Presage
    And click button add to cart
    Then click icon cart

*** Keywords ***
Given I open jamtangan
    Open Browser    ${URL}    chrome
    Maximize Browser Window

And click menu masuk
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'OKE')]
    Click Element    xpath=//button[contains(text(), 'OKE')]
    Wait Until Element Is Visible    id=moe-dontallow_button
    Click Button    id=moe-dontallow_button
    Click Button    id=login-button

Then I input credentials account
    Input Text    name=username    fadhilahalwi09@gmail.com
    Input Text    name=password    Father153@

And I click button login
    Click button    xpath=//button[contains(@class, 'qa-login-button')]
    Sleep    1

Then I search Presage
    Input Text    xpath=//input[@data-testid='search-input']    Presage SRPB43j1
    Sleep    1
    Click Element    xpath=//a[@data-testid='search__content-related-product']

And click button add to cart
    Click Button    id=btn-add-to-cart

Then click icon cart
    Click Button    xpath=//span[@class='ic-cart text-primary-1 qa-cart-button justify-end flex']
    Click Button    xpath=//span[@class='ic-minus text-neutral-300']
    Mouse Over    xpath=//span[@class='ic-chevron-down text-primary-1 text-2xl cursor-pointer']

    
