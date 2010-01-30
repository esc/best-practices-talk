import numpy
import unittest

def euclidian_distance(x, y):
    return numpy.sqrt(sum((x - y)**2))

class TestEuclid(unittest.TestCase):
    def test_scalar(self):
        self.assertEqual(euclidian_distance(numpy.array([2]), numpy.array([3])),
                1.0)
    def test_vector(self):
        self.assertEqual(euclidian_distance(numpy.array([2,2]),
            numpy.array([5,6])), 5.0)

if __name__ == "__main__":
    unittest.main()
