*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/DanaPensiunPage.robot
Resource    ../PageObject/FinancialCalculatorPage.robot
Resource    ../PageObject/PensiunResultPage.robot

*** Keywords ***
Access Dana Pensiun page
    Given user is on sequis home page
    when user go to dana pensiun from home page
    Then user is on dana pensiun page

Access financial calculator page
    Given Access Dana Pensiun page
    When user go to financial calculator page
    Then user is on financaial calculator page

Calculate dana pensiun
    [Arguments]    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    Given Access financial calculator page
    When user input data for caculate dana pensiun    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    Then user is on pensiun result page

Calculate dana pensiun and recalculate
    [Arguments]    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    Given Calculate dana pensiun    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    When user click hitung ulang on pensiun result page
    Then user is on financaial calculator page

Calculate dana pensiun and get result
    [Arguments]    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    Given Calculate dana pensiun    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    When user click dapatkan hasil on pensiun result page 
    And user input data to get pensiun result
    Then form get pensiun result should be closed