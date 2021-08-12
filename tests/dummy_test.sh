#!/bin/bash

include './tests/utils.sh'

function test_dummy()
{
  assertTrue '1'
}

invoke_shunit
