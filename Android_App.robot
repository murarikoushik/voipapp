*** Settings ***
Library           AppiumLibrary

*** Test Cases ***
launch secvoip
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=84B7N16302003299    appPackage=com.motorolasolutions.privatetelephony    appActivity=com.motorolasolutions.privatetelephony.activity.MainPage
    Sleep    5s

Dial pad
    Click A Point    x=100    y=580    duration=100
