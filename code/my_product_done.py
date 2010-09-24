def my_func(numbers):
    """ Difference between sum and product of sequence. """
    product_value = my_product(numbers)
    sum_value = sum(numbers)
    return product_value - sum_value


def my_product(numbers):
    """ Compute the product of a sequence of numbers. """
    total = 1
    for item in numbers:
        total *= item
    return total
