#!/usr/bin/env bash
#--------------------------------------------
# Default Bash Script Header
set -Eeuo pipefail
trap stacktrace EXIT
function stacktrace {
	if [ $? != 0 ]; then
		echo -e "\nThe command '$BASH_COMMAND' triggerd a stacktrace:"
		for i in $(seq 1 $((${#FUNCNAME[@]} - 2))); do j=$(($i+1)); echo -e "\t${BASH_SOURCE[$i]}: ${FUNCNAME[$i]}() called in ${BASH_SOURCE[$j]}:${BASH_LINENO[$i]}"; done
	fi
}

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
#--------------------------------------------
cd "$SCRIPT_DIR"

# save CNAME
if [ -f docs/CNAME ]; then
	mv docs/CNAME ./
fi

# remove old files
rm -rf docs

# regenerate content
"$(go env GOPATH)/bin/"hugo

# move CNAME back
if [ -f CNAME ]; then
	mv CNAME docs/CNAME
fi
