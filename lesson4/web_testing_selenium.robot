*** Settings ***
Documentation     Lesson 4: Web Testing với Selenium
...               Mục tiêu: Kiểm thử web bằng cách sử dụng SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            file://${CURDIR}/simple_web_page.html
${USERNAME}       user
${PASSWORD}       pass
${SEARCH_TERM}    Sản phẩm A

*** Test Cases ***
Ví dụ Đăng Nhập Thành Công
    [Documentation]    Minh họa cách đăng nhập vào trang web
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=username    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    css=button[type='submit']
    Page Should Contain    Chào mừng, user!
    [Teardown]    Close Browser

Bài Tập: Tự Động Đăng Nhập
    [Documentation]    Bài tập: Tạo test case tự động đăng nhập
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Chào mừng, user!
    [Teardown]    Close Browser

Bài Tập: Kiểm Tra Chức Năng Tìm Kiếm
    [Documentation]    Bài tập: Kiểm tra chức năng tìm kiếm sản phẩm
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập    ${USERNAME}    ${PASSWORD}
    Tìm Kiếm Sản Phẩm    ${SEARCH_TERM}
    Page Should Contain    Kết quả tìm kiếm cho "${SEARCH_TERM}"
    [Teardown]    Close Browser

*** Keywords ***
Đăng Nhập
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type='submit']

Tìm Kiếm Sản Phẩm
    [Arguments]    ${search_term}
    Input Text    id=searchInput    ${search_term}
    Click Button    css=#searchForm button[type='submit']