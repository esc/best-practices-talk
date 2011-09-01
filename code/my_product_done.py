from my_product import my_product

def my_func(numbers):
    """ Difference between sum and product of sequence. """
    product_value = my_product(numbers)
    sum_value = sum(numbers)
    return product_value - sum_value
