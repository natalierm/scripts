#!/bin/bash

. ../../json_config

function isEqual () {
  if [ "$1" == "$2" ]; then
    return 0
  else
    return 1
  fi
}

function isNotEqual () {
  if isEqual $1 $2; then
    return 1
  else
    return 0
  fi
}

TEST_FILE=test_file.json

# just output a file to test against
cat << EOF > $TEST_FILE
{
  "value1": "string",
  "value2": 2,
  "value3": {
    "nest1": "string",
    "nest2": 3
  }
}
EOF

VALUE1=$(GetValue $TEST_FILE "value1")
VALUE2=$(GetValue $TEST_FILE "value2")
NEST1=$(GetValue $TEST_FILE "value3.nest1")
NEST2=$(GetValue $TEST_FILE "value3.nest2")

EXPECTED="string"
if isNotEqual $VALUE1 $EXPECTED; then
  echo "$VALUE1 != $EXPECTED"
  exit 1
fi

EXPECTED=2
if isNotEqual $VALUE2 $EXPECTED; then
  echo "$VALUE2 != $EXPECTED"
  exit 2
fi

EXPECTED="string"
if isNotEqual $NEST1 $EXPECTED; then
  echo "$NEST1 != $EXPECTED"
  exit 3
fi

EXPECTED=3
if isNotEqual $NEST2 $EXPECTED; then
  echo "$NEST2 != $EXPECTED"
  exit 4
fi

rm $TEST_FILE
exit 0
