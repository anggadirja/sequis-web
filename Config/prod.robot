*** Settings ***
Library    SeleniumLibrary        timeout=60        run_on_failure=Capture Page Screenshot
Library    String
Library    BuiltIn

*** Variables ***
${BROWSER}                  chrome
${URL}                      https://sequis.co.id/

*** Keywords ***
Begin Web Test
    Open Browser                about:blank    ${BROWSER}
    # Maximize Browser Window
    Set Window Size    1920    1080
    Go To                       ${URL}

End Web Test
    Close Browser

