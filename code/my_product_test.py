import nose.tools as nt
from my_product import my_product

def test_my_product():
    """ Test my_product() on simple case. """
    nt.assert_equal(my_product([1, 2, 3]), 6)

def test_raise_type_error():
    """ Test that my_product raises a type error. """
    nt.assert_raises(TypeError, my_product, ['abc', 1, 2, 3])
