from numbers import Number

def my_product(numbers):
    """ Compute the product of a sequence of numbers. """
    total = 1
    for item in numbers:
        if not isinstance(item, Number):
            raise TypeError("%r unsupported by 'my_product'" %type(item))
        total *= item
    return total
