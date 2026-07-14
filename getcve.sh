#!/bin/sh

test "$#" -eq 0 && set -- CVE-*

for D in "$@"; do
	test -e "$D" || mkdir "$D"
	test \! -d "$D" && { echo "not a directory: $D" >&2; continue; }

	echo "$D" >&2
	wget -O - "https://cveawg.mitre.org/api/cve/$D" | jq > "$D/cve.json"
done
