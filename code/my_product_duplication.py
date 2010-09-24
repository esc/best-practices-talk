import numpy

def my_product(numbers):
    """ Compute the product of a sequence of numbers. """
    total = 1
    for item in numbers:
        total *= item
    return total


def my_product_refactor(numbers):
    """ Compute the product of a sequence of numbers. """
    return numpy.prod(numbers)

