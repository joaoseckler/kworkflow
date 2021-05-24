#!/bin/bash

include "./tests/utils"
include "./kw"

function suite
{
  suite_addTest "validate_global_variables_Test"
  suite_addTest "check_kworkflow_global_variable_Test"
}

function validate_global_variables_Test
{
  VARS=( KWORKFLOW KW_LIB_DIR )
  for v in "${VARS[@]}"; do
    test -z ${!v+x}; assertEquals "Variable $v should exist." $? 1
  done
}

function check_kworkflow_global_variable_Test
{
  VARS=( KWORKFLOW )
  for v in "${VARS[@]}"; do
    [[ $(declare -p $v)  =~ ^declare\ -[aAilrtu]*x[aAilrtu]*\  ]] ||
      fail "Variable $v should have been exported"
  done
}

invoke_shunit
