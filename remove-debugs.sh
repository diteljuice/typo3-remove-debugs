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
  find ./ -type f -path ./_save -prune -o -name '*.js' -exec sed -i "/$js/d" {} \;
done

# Delete PHP debugs
for php in ${PHP_DEBUGS[@]};
do
  find ./ -path ./_save -prune -o -name '*.php*' -exec sed -i "/$php/d" {} \;
done

# Delete Fluid debugs
for f in ${FLUID_DEBUGS[@]};
do
  find ./ -type f -path ./_save -prune -o -name '*.html' -exec sed -i "/$f/d" {} \;
done

echo "--- Remove debug script done ---"
