import unittest

def my_sum(my_list):
    """ Compute sum of list elements. """
    return sum(my_list)

class Test(unittest.TestCase):
    def test_my_sum(self):
        self.assertEqual(my_sum([1,2,3]),6)

if __name__ == "__main__":
    unittest.main()
