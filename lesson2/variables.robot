*** Settings ***
Documentation     Lesson 2: Variables trong Robot Framework
...               Mục tiêu: Làm quen với biến (variables) và cách sử dụng trong test case.
Library           Collections

*** Variables ***
# Scalar Variables (Biến vô hướng)
${USERNAME}       testuser@example.com
${PASSWORD}       password123
${URL}            https://example.com

# List Variables (Biến danh sách)
@{FRUITS}         apple    banana    orange    grape

# Dictionary Variables (Biến từ điển)
&{USER_INFO}      name=John Doe    age=30    email=john@example.com

*** Test Cases ***
Ví dụ Sử Dụng Biến Vô Hướng
    [Documentation]    Minh họa cách sử dụng biến vô hướng
    Log    Đăng nhập với tài khoản: ${USERNAME}
    Log    Tại URL: ${URL}
    ${login_message}=    Set Variable    Đăng nhập thành công với mật khẩu: ${PASSWORD}
    Log    ${login_message}

Ví dụ Sử Dụng Biến Danh Sách
    [Documentation]    Minh họa cách sử dụng biến danh sách
    Log    Danh sách các loại trái cây:
    FOR    ${fruit}    IN    @{FRUITS}
        Log    - ${fruit}
    END
    Log    Trái cây đầu tiên là: ${FRUITS}[0]
    Log    Trái cây cuối cùng là: ${FRUITS}[-1]

Ví dụ Sử Dụng Biến Từ Điển
    [Documentation]    Minh họa cách sử dụng biến từ điển
    Log    Thông tin người dùng:
    Log    Tên: ${USER_INFO}[name]
    Log    Tuổi: ${USER_INFO}[age]
    Log    Email: ${USER_INFO}[email]

Sử Dụng Biến Trong Test Case
    [Documentation]    Bài tập: Sử dụng biến để lưu trữ thông tin đăng nhập
    ${current_url}=    Set Variable    ${URL}
    ${login_status}=    Login To Website    ${USERNAME}    ${PASSWORD}    ${current_url}
    Should Be Equal    ${login_status}    success

Sử Dụng Danh Sách Trong Test Case
    [Documentation]    Bài tập: Sử dụng danh sách để lặp qua các giá trị
    @{colors}=    Create List    red    blue    green    yellow
    FOR    ${color}    IN    @{colors}
        Log    Màu hiện tại: ${color}
        Run Keyword If    '${color}' == 'blue'    Log    Đã tìm thấy màu xanh!
    END

*** Keywords ***
Login To Website
    [Arguments]    ${username}    ${password}    ${url}
    [Documentation]    Mô phỏng đăng nhập vào website
    Log    Đang truy cập ${url}
    Log    Đăng nhập với tài khoản ${username}
    Log    Sử dụng mật khẩu ${password}
    RETURN    success