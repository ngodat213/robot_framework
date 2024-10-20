*** Settings ***
Documentation     Lesson 2: Keywords và cấu trúc Test Case
...               Mục tiêu: Hiểu cách sử dụng các từ khóa (keywords) có sẵn và cấu trúc test case.
Library           BuiltIn

*** Variables ***
${SỐ_1}           5
${SỐ_2}           3
${KẾT_QUẢ_MONG_ĐỢI}    8

# Test case
*** Test Cases ***
Ví dụ Sử Dụng Từ Khóa Cơ Bản
    [Documentation]    Minh họa cách sử dụng các từ khóa cơ bản
    [Tags]    basic    example
    Log    Bắt đầu test case sử dụng từ khóa cơ bản
    ${kết_quả}=    Evaluate    ${SỐ_1} + ${SỐ_2}
    Should Be Equal As Integers    ${kết_quả}    ${KẾT_QUẢ_MONG_ĐỢI}
    Run Keyword If    ${kết_quả} > 5    Log    Kết quả lớn hơn 5

Bài Tập: Phép Cộng Với Setup và Teardown
    [Documentation]    Bài tập: Tạo test case thực hiện phép cộng với setup và teardown
    [Tags]    exercise
    [Setup]    Log    Bắt đầu bài tập phép cộng
    ${kết_quả}=    Cộng Hai Số    ${SỐ_1}    ${SỐ_2}
    Should Be Equal As Integers    ${kết_quả}    ${KẾT_QUẢ_MONG_ĐỢI}
    Log    Kết quả phép cộng: ${kết_quả}
    [Teardown]    Log    Kết thúc bài tập phép cộng

*** Keywords ***
Cộng Hai Số
    [Arguments]    ${số_1}    ${số_2}
    [Documentation]    Từ khóa tùy chỉnh để cộng hai số
    ${tổng}=    Evaluate    ${số_1} + ${số_2}
    RETURN    ${tổng}

*** Settings ***
# Setup để đảm bảo các điều kiện để chạy các test step
Test Setup        Log    Chuẩn bị chung cho mỗi test case
# Teardown sử dụng để dọn đẹp sau khi test case hoặc test suite hoàn thành
# Đảm bảo quá trình kiểm thử trả về trạng thái ban đầu
Test Teardown     Log    Dọn dẹp chung sau mỗi test case