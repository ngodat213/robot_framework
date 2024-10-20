*** Settings ***
Documentation    Kiểm thử tính năng đăng ký người dùng.
Library          SeleniumLibrary

*** Variables ***
${BROWSER}                      chrome
${URL}                          http://127.0.0.1:5502/sign-up.html
${USERNAME}                     ngodat213
${EMAIL}                        ngodat.itt213@gmail.com
${PASSWORD}                     Code26102003

# Các trường hợp đăng ký thất bại
${USERNAME_FAILED}              ngodat213
${EMAIL_FAILED}                 ngodat.it213@gmail.com
${PASSWORD_FAILED}              Code261020033

# Email không hợp lệ
${USERNAME_INVALID_EMAIL}       ngodat213
${EMAIL_INVALID_EMAIL}          ngodat.it213gmail.com
${PASSWORD_INVALID_EMAIL}       Code26102003

# Password không hợp lệ
${USERNAME_INVALID_PASSWORD}    ngodat213
${EMAIL_INVALID_PASSWORD}       ngodat.it213@gmail.com
${PASSWORD_INVALID_PASSWORD}    1111

# Tài khoản rỗng
${USERNAME_EMPTY}               ${EMPTY}
${EMAIL_EMPTY}                  ${EMPTY}
${PASSWORD_EMPTY}               ${EMPTY}

*** Test Cases ***
Đăng ký thành công
    [Documentation]    Kiểm thử đăng ký thành công
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME}    ${EMAIL}    ${PASSWORD}
    Alert Should Be Present    Sign Up Success
    [Teardown]                 Close Browser

Đăng ký thất bại - email không hợp lệ
    [Documentation]    Kiểm thử đăng ký với email không hợp lệ
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME_INVALID_EMAIL}    ${EMAIL_INVALID_EMAIL}    ${PASSWORD_INVALID_EMAIL}
    Alert Should Be Present    Email khong dung dinh dang
    [Teardown]                 Close Browser

Đăng ký thất bại - password không hợp lệ
    [Documentation]    Kiểm thử đăng ký với password không hợp lệ
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME_INVALID_PASSWORD}    ${EMAIL_INVALID_PASSWORD}    ${PASSWORD_INVALID_PASSWORD}
    Alert Should Be Present    Password > 8 ki tu
    [Teardown]                 Close Browser

Đăng ký thất bại - tất cả trường đều rỗng
    [Documentation]    Kiểm thử đăng ký với tất cả trường rỗng
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME_EMPTY}    ${EMAIL_EMPTY}    ${PASSWORD_EMPTY}
    Alert Should Be Present    FullName khong duoc rong
    [Teardown]                 Close Browser

Đăng ký thất bại - email rỗng
    [Documentation]    Kiểm thử đăng ký với trường email rỗng
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME}    ${EMAIL_EMPTY}    ${PASSWORD}
    Alert Should Be Present    Email khong duoc rong
    [Teardown]                 Close Browser

Đăng ký thất bại - password rỗng
    [Documentation]    Kiểm thử đăng ký với trường password rỗng
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Ký           ${USERNAME}    ${EMAIL}    ${PASSWORD_EMPTY}
    Alert Should Be Present    Password khong duoc rong
    [Teardown]                 Close Browser

*** Keywords ***
Đăng Ký
    [Arguments]    ${username}    ${email}    ${password}
    Input Text     id=username    ${username}
    Input Text     id=email       ${email}
    Input Text     id=password    ${password}
    Click Button   css=button[type='submit']
