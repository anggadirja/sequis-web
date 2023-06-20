*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${textDanaPensiunActiveMenu}              xpath=//a[@href='#' and text()='Dana Pensiun']
${buttonOptionOnDanaPensiunPage}          xpath=//span[contains(text(),'Silakan pilih di sini')]
${dropdownOptionOnDanaPensiunPage}        xpath=//span[contains(text(),'Dana pensiun')]
${buttonSelanjutnyaOnDanaPensiunPage}     xpath=//button[contains(text(),'Selanjutnya')]
${buttoClosePopUp}                        xpath=//button[@data-content='x']

*** Keywords ***
user is on dana pensiun page 
    Wait Until Element Is Visible    ${textDanaPensiunActiveMenu}
    Element Should Be Visible        ${textDanaPensiunActiveMenu}
    ${isDisplayed}                   Run Keyword And Return Status    Wait Until Element Is Visible    ${buttoClosePopUp}    timeout=5
    Run Keyword If                   ${isDisplayed} == False          Log To Console                   not get popup cookies
    ...    ELSE                      Click Element                    ${buttoClosePopUp}

user click button option on dana pensiun page
    Wait Until Element Is Visible    ${buttonOptionOnDanaPensiunPage}
    Click Element                    ${buttonOptionOnDanaPensiunPage}

user choose dana pensiun option
    Wait Until Element Is Visible    ${dropdownOptionOnDanaPensiunPage}
    Click Element                    ${dropdownOptionOnDanaPensiunPage}

user click button selanjutnya on dana pensiun page
    Wait Until Element Is Visible    ${buttonSelanjutnyaOnDanaPensiunPage}
    Click Element                    ${buttonSelanjutnyaOnDanaPensiunPage}

user go to financial calculator page
    user click button option on dana pensiun page
    user choose dana pensiun option
    user click button selanjutnya on dana pensiun page
