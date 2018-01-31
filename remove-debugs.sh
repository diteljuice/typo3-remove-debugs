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
for js in ${JS_DEBUGS[@]};
do
  if egrep -qr --include="*.js" "$js" .;
  then
    printf "<<<< Found Javascript debugs:>>>>\n"
    egrep -rHn --include="*.js" "$js" . | cut -d":" -f1-2
    printf "<<<< Found Javascript debugs:>>>>\n\n"
    flagFound=1
  fi
done

# Delete PHP debugs
for php in ${PHP_DEBUGS[@]};
do
  if egrep -qr --include="*.html" "$php" .;
  then
    printf "<<<< Found PHP debugs:>>>>\n"
    egrep -rHn --include="*.html" "$php" . | cut -d":" -f1-2
    printf "<<<< Found PHP debugs:>>>>\n\n"
    flagFound=1
  fi
done

# Delete Fluid debugs
for f in ${FLUID_DEBUGS[@]};
do
  if egrep -qr --include="*.html" "$f" .;
  then
    printf "<<<< Found Fluid debugs:>>>>\n"
    egrep -rHn --include="*.html" "$f" . | cut -d":" -f1-2
    printf "<<<< Found Fluid debugs:>>>>\n\n"
    flagFound=1
  fi
done

# Return exit code depending on flagFound
if [[ $flagFound == 1 ]];
then
  exit 1
else
  exit 0
fi
