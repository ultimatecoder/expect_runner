#! /bin/sh

help () {
  echo "Usage"
  echo ""
  echo "    garud [test-cases-dir]"
  echo ""
  echo "Arguments"
  echo "    test-cases-dir: The directory where all expect test cases are present"
}

if [ $# -eq 1 ]
then
  TARGET_DIR=$1
  FILE_EXTENSION="expect"

  for SCRIPT in `find $TARGET_DIR -name *.$FILE_EXTENSION`
  do
    echo "## Executing tests written in $SCRIPT"
    echo ""
    expect $SCRIPT
    echo ""
    echo "## Ended executing $SCRIPT"
    echo ""
  done
else
  help
fi
