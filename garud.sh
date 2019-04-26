#! /bin/sh

# Installation
# ---------------
#
# Step-1 : Create directory
# mkdir ~/garud
#
# Step-2 : Download the garud.sh script
# wget https://gist.githubusercontent.com/ultimatecoder/801177083c722884d8e6ff76bb342c8d/raw/9236f8e8354ef324c10a19c372d21b8f05431a58/garud.sh -O ~/garud/garud
#
# Step-3: Give executable permission
# chmod +rwx ~/garud/garud
#
# Step-3: Add Garud directory to PATH.
# echo "export PATH=$PATH:~/garud" >> ~/.bashrc
#
# Step-4: Refresh Bash
# source ~/.bashrc
#

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
