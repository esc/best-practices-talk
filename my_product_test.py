import nose.tools as nt

def my_product(li):
    """ Compute the product of a list of numbers. """
    total = 1
    for i in li:
        total *= i
    return total

def test_my_product():
    """ Test my_product() on simple case. """
    nt.assert_equal(my_product([1,2,3]),6)
