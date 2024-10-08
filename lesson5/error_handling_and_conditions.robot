*** Settings ***
Documentation     Lesson 5: Xử lý lỗi và điều kiện
...               Mục tiêu: Học cách xử lý lỗi và điều kiện trong Robot Framework.
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}        chrome
${URL}            file://${CURDIR}/simple_web_page.html
${VALID_USER}     user
${VALID_PASS}     pass
${INVALID_PASS}   wrongpass

*** Test Cases ***
Ví dụ Sử Dụng Điều Kiện
    [Documentation]    Minh họa cách sử dụng câu lệnh điều kiện
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${element_exists}=    Run Keyword And Return Status    Element Should Be Visible    id=loginForm
    Run Keyword If    ${element_exists}    Log    Form đăng nhập hiển thị
    ...    ELSE    Log    Form đăng nhập không tìm thấy
    Run Keyword Unless    ${element_exists}    Fail    Không tìm thấy form đăng nhập
    [Teardown]    Close Browser

Ví dụ Xử Lý Lỗi
    [Documentation]    Minh họa cách xử lý lỗi
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${status}    ${message}=    Run Keyword And Ignore Error    Click Element    id=non_existent_element
    Run Keyword If    '${status}' == 'FAIL'    Log    Không tìm thấy phần tử, nhưng test vẫn tiếp tục
    [Teardown]    Close Browser

Bài Tập: Kiểm Tra Điều Kiện Trên Trang Web
    [Documentation]    Bài tập: Tạo test case kiểm tra các thành phần trên trang web
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${login_form_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=loginForm
    ${search_form_visible}=    Run Keyword And Return Status    Element Should Be Visible    id=searchForm
    Run Keyword If    ${login_form_visible}    Log    Form đăng nhập hiển thị
    Run Keyword If    ${search_form_visible}    Log    Form tìm kiếm hiển thị
    Run Keyword If    ${login_form_visible} and not ${search_form_visible}    Log    Chỉ form đăng nhập hiển thị
    [Teardown]    Close Browser

Bài Tập: Xử Lý Lỗi Đăng Nhập
    [Documentation]    Bài tập: Viết test case xử lý lỗi đăng nhập với mật khẩu sai
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=username    ${VALID_USER}
    Input Password    id=password    ${INVALID_PASS}
    Click Button    css=button[type='submit']
    ${status}    ${message}=    Run Keyword And Ignore Error    Page Should Contain    Chào mừng
    Run Keyword If    '${status}' == 'FAIL'    Log    Đăng nhập thất bại như mong đợi
    ...    ELSE    Fail    Đăng nhập thành công mặc dù sử dụng mật khẩu sai
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