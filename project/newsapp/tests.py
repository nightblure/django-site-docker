from django.test import TestCase


# Create your tests here.
def test_func():
    assert 'test'


from django.test import TestCase
from newsapp.models import Category
from django.utils import timezone


# models test
# https://realpython.com/testing-in-django-part-1-best-practices-and-examples/#best-practices
class WhateverTest(TestCase):

    def create_whatever(self, title="only a test", body="yes, this is only a test"):
        return Category.objects.create(title=title)

    def test_whatever_creation(self):
        w = self.create_whatever()
        self.assertTrue(str(w), w.title)
