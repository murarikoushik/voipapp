*** Settings ***
Library           AppiumLibrary

*** Variables ***
${sleep_timer}    1s
${Dial_conf_bridge_first}    id=two    # first number
${Dial_conf_bridge_second}    id=three    # second number
${Dial_conf_bridge_third}    id=four    # third number
${Click_call_x}    853    # x coordinate to click call
${Click_call_y}    2220    # y coordinate to click call
${Duration_for_click}    50
${Click_dialpad_x}    1055    # Test case launch dial pad
${Click_dialpad_y}    200    # Test case launch dialpad
${Click_back_arrow_x}    99    # Back arrow
${Click_back_arrow_y}    182    # Back arrow
${voip_server_status}    Active    # Check if Voip server is connected
@{VALUES}         Waiting to connect

*** Test Cases ***
launch secvoip
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=84B7N16302003299    appPackage=com.motorolasolutions.privatetelephony    appActivity=com.motorolasolutions.privatetelephony.activity.MainPage
    Sleep    ${sleep_timer}

Check VOIP server status
    Click A Point    1370    196    ${Duration_for_click}
    Click Element    name=Settings
    Click Element    name=Configuration
    Click Element    name=Manage Servers
    Sleep    ${sleep_timer}
    Wait Until Page Contains    ${voip_server_status}    timeout=10    error=None
    ${Contexts}=    Get Contexts
    ${Current_contexts}=    Get Current Context
    : FOR    ${VALUE}    IN    @{VALUES}
    \    Exit For Loop If    '${voip_server_status}'=='Waiting to connect'
    \    Click A Point    ${Click_back_arrow_x}    ${Click_back_arrow_y}    ${Duration_for_click}
    \    Sleep    ${sleep_timer}
    \    Click A Point    ${Click_back_arrow_x}    ${Click_back_arrow_y}    ${Duration_for_click}
    \    Sleep    ${sleep_timer}
    \    Click A Point    ${Click_back_arrow_x}    ${Click_back_arrow_y}    ${Duration_for_click}
    \    Sleep    ${sleep_timer}

launch Dial pad
    Click A Point    ${Click_dialpad_x}    ${Click_dialpad_y}    ${Duration_for_click}
    Sleep    ${sleep_timer}

Get page contents and dial
    Get Contexts
    Click Element    ${Dial_conf_bridge_first}
    Click Element    ${Dial_conf_bridge_third}
    Click Element    ${Dial_conf_bridge_second}
    Click Element    ${Dial_conf_bridge_first}
    Click Element    ${Dial_conf_bridge_first}
    Sleep    ${sleep_timer}

Click call
    Click A Point    ${Click_call_x}    ${Click_call_y}    ${Duration_for_click}
    Sleep    ${sleep_timer}

Verify success call
    Wait Until Page Contains    Secure Connection    timeout=10    error=None
