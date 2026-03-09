from init import square


def test_square_positive():
    assert square(3) == 9, (
        "Квадрат положительного числа должен быть равен произведению чисел."
    )


def test_square_zero():
    assert square(0) == 0, "Квадрат нуля должен быть нулём."


def test_square_negative():
    assert square(-4) == 16, (
        "Квадрат отрицательного числа должен быть положительным числом."
    )


def test_square_float():
    assert abs(square(2.5) - 6.25) < 1e-9, (
        "Квадрат дробного числа должен давать точный результат."
    )
