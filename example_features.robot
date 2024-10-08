*** Settings ***
Documentation     Ví dụ về các tính năng của Robot Framework
Library           SeleniumLibrary
Library           OperatingSystem
Library           String

*** Variables ***
${BROWSER}        Chrome
${URL}            D:///workspace/robot_fw/login.html
${USERNAME}       user@example.com
${PASSWORD}       password123

*** Test Cases ***
Example Test Case
    [Documentation]    Ví dụ về một test case đơn giản
    [Tags]    regression    smoke
    Log    Đây là một test case đơn giản

Web Test Example
    [Documentation]    Ví dụ về test web với Selenium
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    css=button[type='submit']
    Page Should Contain    Chào mừng
    [Teardown]    Close Browser

Invalid Login Test
    [Documentation]    Kiểm tra đăng nhập không hợp lệ
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=username    invalid@example.com
    Input Password    id=password    wrongpassword
    Click Button    css=button[type='submit']
    Alert Should Be Present    Đăng nhập thất bại. Vui lòng thử lại.
    [Teardown]    Close Browser

File Operation Example
    [Documentation]    Ví dụ về thao tác với file
    ${content}=    Set Variable    Đây là nội dung file test
    Create File    test.txt    ${content}
    ${read_content}=    Get File    test.txt
    Should Be Equal    ${content}    ${read_content}
    Remove File    test.txt

Variable and Keyword Example
    [Documentation]    Ví dụ về biến và từ khóa
    ${name}=    Set Variable    Robot Framework
    ${greeting}=    Catenate    Xin chào    ${name}
    Should Be Equal    ${greeting}    Xin chào Robot Framework
    ${uppercase}=    Convert To Upper Case    ${greeting}
    Should Be Equal    ${uppercase}    XIN CHÀO ROBOT FRAMEWORK

*** Keywords ***
Custom Keyword Example
    [Arguments]    ${arg1}    ${arg2}
    [Documentation]    Ví dụ về từ khóa tùy chỉnh
    ${result}=    Evaluate    ${arg1} + ${arg2}
    [Return]    ${result}

Setup Example
    [Documentation]    Ví dụ về thiết lập
    Log    Đang thực hiện thiết lập

Teardown Example
    [Documentation]    Ví dụ về dọn dẹp
    Log    Đang thực hiện dọn dẹp

*** Settings ***
Suite Setup       Setup Example
Suite Teardown    Teardown Example
Test Setup        Log    Bắt đầu test case
Test Teardown     Log    Kết thúc test case