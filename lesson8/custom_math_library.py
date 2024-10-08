import math

class CustomMathLibrary:
    def calculate_circle_area(self, radius):
        """Tính diện tích hình tròn."""
        return math.pi * radius ** 2

    def calculate_triangle_area(self, base, height):
        """Tính diện tích tam giác."""
        return 0.5 * base * height

    def calculate_fibonacci(self, n):
        """Tính số Fibonacci thứ n."""
        if n <= 0:
            return "N phải là số nguyên dương"
        elif n == 1 or n == 2:
            return 1
        else:
            a, b = 1, 1
            for _ in range(3, n + 1):
                a, b = b, a + b
            return b

    def is_prime(self, number):
        """Kiểm tra số nguyên tố."""
        if number < 2:
            return False
        for i in range(2, int(math.sqrt(number)) + 1):
            if number % i == 0:
                return False
        return True