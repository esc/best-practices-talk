import nose.tools as nt

def my_product(numbers):
    """ Compute the product of a sequence of numbers. """
    total = 1
    for item in numbers:
        total *= item
    return total


def test_my_product():
    """ Test my_product() on simple case. """
    nt.assert_equal(my_product([1, 2, 3]), 6)
