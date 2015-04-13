#!/bin/bash - 
#===============================================================================
#
#          FILE: bundle.sh
# 
#         USAGE: ./bundle.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 12/10/2014 14:20
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

for i in $(ls ./bundle);
do
  mv ./bundle/$i ./bundle_available 
  ln -s ./bundle_available/$i ./bundle/$i
done

