#! /bin/bash

#
# Remove debugs from:
# * Javascript files (console.logs and console.trace)
# * PHP files (var_dumps and TYPO3 debugging)
# * TYPO3 Fluid files (<f:debug> and {f:debug})
#
# Script by Benjamin Ditel - 2018
# https://github.com/diteljuice
# Use as you like, but please keep copyright in the files
#

# Load config files
. "./debugs.cfg"

# Delete Javascript debugs
# for js in ${JS_DEBUGS[@]};
# do
#   find ./ -type f -path ./_save -prune -o -name '*.js' -exec sed -i "/$js/d" {} \;
# done

# Delete PHP debugs
# for php in ${PHP_DEBUGS[@]};
# do
#   #find ./ -path ./_save -prune -o -name '*.php*' -exec sed -i "/$php/d" {} \;
# done

echo $?
flagFound=0

# Delete Fluid debugs
for f in ${FLUID_DEBUGS[@]};
do
  if egrep -r --include="*.html" "$f" .;
  then
    printf "<<<< Found Fluid debugs:>>>>\n"
    egrep -rHn --include="*.html" "$f" . | cut -d":" -f1-2
    printf "<<<< Found Fluid debugs:>>>>\n\n"
    echo "in then: $?"
    flagFound=1
  fi
done

if [[ $flagFound == 1]];
then
  exit 1
else
  exit 0
fi

#echo "--- \"Check for debugs\" script done ---"
