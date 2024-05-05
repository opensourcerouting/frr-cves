#!/bin/sh

for D in CVE-*; do
	test -d "$D" || continue
	test -e "$D/cve.json" && continue

	wget -O "$D/cve.json" "https://cveawg.mitre.org/api/cve/$D"
	jq < "$D/cve.json" > "$D/cve-pretty.json"
done
