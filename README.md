# Hướng dẫn Robot Framework

Đây là một loạt bài học về Robot Framework, bao gồm các ví dụ và bài tập để giúp bạn học cách sử dụng Robot Framework cho kiểm thử tự động.

## Yêu cầu hệ thống

- Python 3.6 trở lên
- pip (trình quản lý gói của Python)

## Cài đặt

1. Cài đặt Robot Framework:
   ```pip install robotframework```

2. Cài đặt các thư viện cần thiết:
   ```pip install robotframework-seleniumlibrary```
   ```pip install robotframework-requests```
   ```pip install robotframework-databaselibrary```

3. Cài đặt trình điều khiển cho trình duyệt (ví dụ: ChromeDriver cho Google Chrome) và đảm bảo nó nằm trong PATH của hệ thống.

## Cấu trúc thư mục
```
├── lesson1/
│ └── keywords_and_testcases.robot
├── lesson2/
│ └── variables.robot
├── lesson3/
│ └── resource_file.robot
├── lesson4/
│ ├── web_testing_selenium.robot
│ └── simple_web_page.html
├── lesson5/
│ └── error_handling_and_conditions.robot
├── lesson6/
│ └── custom_keywords.robot
├── lesson7/
│ ├── data_driven_testing.robot
│ └── login_data.csv
├── lesson8/
│ ├── custom_math_library.py
│ └── advanced_custom_libraries.robot
├── lesson9/
│ └── api_testing.robot
└── lesson10/
└── database_testing.robot
```
## Chạy các test case

Để chạy một file test cụ thể, sử dụng lệnh:
```robot path/to/test_file.robot```
Ví dụ: 
```robot lesson1/keywords_and_testcases.robot```

## Nội dung các bài học

### Lesson 1: Keywords và cấu trúc Test Case
- Sử dụng các từ khóa cơ bản
- Cấu trúc của một test case
- Sử dụng Setup và Teardown
- Tạo từ khóa tùy chỉnh đơn giản

### Lesson 2: Variables trong Robot Framework
- Sử dụng biến vô hướng, danh sách và từ điển
- Ví dụ về vòng lặp và điều kiện với biến

### Lesson 3: Library và Resource
- Sử dụng các thư viện có sẵn
- Tạo và sử dụng file resource

### Lesson 4: Web Testing với Selenium
- Sử dụng SeleniumLibrary cho kiểm thử web
- Thao tác với các phần tử trên trang web
- Kiểm tra nội dung trang

### Lesson 5: Xử lý lỗi và điều kiện
- Sử dụng câu lệnh điều kiện
- Xử lý lỗi trong Robot Framework

### Lesson 6: Tạo từ khóa tùy chỉnh (Custom Keywords)
- Định nghĩa và sử dụng từ khóa tùy chỉnh
- Truyền tham số cho từ khóa

### Lesson 7: Data-Driven Testing
- Sử dụng vòng lặp để xử lý nhiều dữ liệu
- Đọc dữ liệu từ file CSV

### Lesson 8: Viết thư viện Python tùy chỉnh
- Tạo thư viện Python đơn giản
- Sử dụng thư viện tùy chỉnh trong Robot Framework

### Lesson 9: Kiểm thử API
- Sử dụng RequestsLibrary để kiểm thử API
- Thực hiện các yêu cầu GET và kiểm tra phản hồi
- Làm việc với dữ liệu JSON

### Lesson 10: Kiểm thử với Database
- Sử dụng DatabaseLibrary để làm việc với SQLite
- Thực hiện các thao tác CRUD cơ bản
- Kiểm tra dữ liệu trong cơ sở dữ liệu

## Lưu ý

- Đảm bảo rằng bạn đã cài đặt tất cả các thư viện cần thiết trước khi chạy các test case.
- Đối với Lesson 4, hãy chắc chắn rằng bạn đã cài đặt trình điều khiển trình duyệt phù hợp.
- Đối với Lesson 10, bạn cần cài đặt SQLite nếu chưa có sẵn trên hệ thống.

## Tài liệu tham khảo

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [RequestsLibrary Documentation](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)
- [DatabaseLibrary Documentation](https://franz-see.github.io/Robotframework-Database-Library/api/0.5/DatabaseLibrary.html)
