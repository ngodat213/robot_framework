*** Settings ***
Documentation     Login Testing
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            http://127.0.0.1:5502/log-in.html
# Login success
${USERNAME}       ngodat.it213@gmail.com
${PASSWORD}       Code26102003
# Login failed
${USERNAME_FAILED}    ngodat.it213@gmail.com
${PASSWORD_FAILED}    Code261020033
# Invalid email
${USERNAME_INVALID_EMAIL}    ngodat.it213gmail.com
${PASSWORD_INVALID_EMAIL}    Code26102003
# Invalid password
${USERNAME_INVALID_PASSWORD}    ngodat.it213@gmail.com
${PASSWORD_INVALID_PASSWORD}    1111
# Invalid email and password
${USERNAME_INVALID_EMAIL_AND_PASSWORD}    ngodat.it21gmail.com
${PASSWORD_INVALID_EMAIL_AND_PASSWORD}    1111
# Empty email
${USERNAME_EMPTY_EMAIL}    
${PASSWORD_EMPTY_EMAIL}    Code26102003
# Empty password
${USERNAME_EMPTY_PASSWORD}    ngodat.it213@gmail.com
${PASSWORD_EMPTY_PASSWORD}    
# Empty email and password
${USERNAME_EMPTY_EMAIL_AND_PASSWORD}    
${PASSWORD_EMPTY_EMAIL_AND_PASSWORD}    

*** Test Cases ***
Login success
    [Documentation]    Login success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME}    ${PASSWORD}
    Alert Should Be Present    Logged in successfully
    [Teardown]    Close Browser

Login failed
    [Documentation]    Login failed
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_FAILED}    ${PASSWORD_FAILED}
    Alert Should Be Present    Error: {"message":"email or password is not matched","error":"Unauthorized","statusCode":401}
    [Teardown]    Close Browser

Invalid email
    [Documentation]    Invalid email
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_INVALID_EMAIL}    ${PASSWORD_INVALID_EMAIL}
    Alert Should Be Present    Email khong dung dinh dang
    [Teardown]    Close Browser

Invalid password
    [Documentation]    Invalid password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_INVALID_PASSWORD}    ${PASSWORD_INVALID_PASSWORD}
    Alert Should Be Present    Password > 8 ki tu
    [Teardown]    Close Browser

Invalid email and password
    [Documentation]    Invalid email and password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_INVALID_EMAIL_AND_PASSWORD}    ${PASSWORD_INVALID_EMAIL_AND_PASSWORD}
    Alert Should Be Present    Email khong dung dinh dang
    [Teardown]    Close Browser

Empty email
    [Documentation]    Empty email
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_EMPTY_EMAIL}    ${PASSWORD_EMPTY_EMAIL}
    Alert Should Be Present    Email khong duoc rong
    [Teardown]    Close Browser

Empty password
    [Documentation]    Empty password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_EMPTY_PASSWORD}    ${PASSWORD_EMPTY_PASSWORD}
    Alert Should Be Present    Password khong duoc rong
    [Teardown]    Close Browser

Empty email and password
    [Documentation]    Empty email and password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME_EMPTY_EMAIL_AND_PASSWORD}    ${PASSWORD_EMPTY_EMAIL_AND_PASSWORD}
    Alert Should Be Present    Email khong duoc rong
    [Teardown]    Close Browser

*** Keywords ***
Đăng Nhập
    [Arguments]    ${username}    ${password}
    Input Text    id=email    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type='submit']
