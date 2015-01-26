#!/usr/bin/env python
# encoding: utf-8

import unittest
import vim_add_it_up as sut

class VimAddItUpTests(unittest.TestCase):
    def test_create_buffer_with_total(self):
        buffer_contents = ['25', '25', '25']
        expected_result = ['25', '25', '25', '=========', 'Total: 75']
        actual_result = sut.create_buffer_with_total(buffer_contents)
        self.assetEqual(expected_result, actual_result)
