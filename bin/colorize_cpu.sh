#!/bin/bash
# colorize_cpu.sh

COOL=60
WARM=80

if [[ $1 < $COOL ]] ; then
  echo "#859900"  # COOL
elif [[ $1 > $WARM ]] ; then
  echo "#dc322f"  # HOT
else
  echo "#cb4b16"  # WARM
fi

exit 0