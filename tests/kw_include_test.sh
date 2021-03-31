#!/bin/bash

include "./tests/utils"

function suite
{
  suite_addTest "include_twice_Test"
  suite_addTest "include_variable_creation_Test"
}

function include_twice_Test()
{
  ID=1
  include ./src/kw_include.sh
  include ./src/kw_include.sh
  ret=$?
  expected_result="0"
  assertEquals "($ID)" "$expected_result" "$ret"
}

function include_variable_creation_Test()
{
  ID=2
  include ./src/kwio.sh
  expected_result="1"
  output=$KWIO_SH_IMPORTED
  assertEquals "($ID)" "$expected_result" "$output"
}

invoke_shunit
