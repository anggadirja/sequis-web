*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${buttonAsuransiJiwa}                   xpath=(//a[text()='Asuransi Jiwa']/parent::li)[1]
${textDanaPensiunOnHomePage}              xpath=//ul[@class='mega-menus__child']//a[@href='/id/asuransi-jiwa/individu/dana-pensiun']

*** Keywords ***
user is on sequis home page 
    Wait Until Element Is Visible    ${buttonAsuransiJiwa}
    Element Should Be Visible        ${buttonAsuransiJiwa}

user click menu asuransi jiwa
    Wait Until Element Is Visible    ${buttonAsuransiJiwa}
    Click Element                    ${buttonAsuransiJiwa}

user go to dana pensiun from home page
    user click menu asuransi jiwa
    Wait Until Element Is Visible    ${textDanaPensiunOnHomePage}
    Click Element                    ${textDanaPensiunOnHomePage}
