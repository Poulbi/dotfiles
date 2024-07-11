#!/bin/sh

url="https://torrentgalaxy.to"
# shellcheck disable=SC2154
# (we expect the variables to be set)

# $1: line number used to get link
get_magnet() { sed -n "${1}p" "$links"; }

get_torrents() {
	next="/torrents.php?search=$query"
	curl -s "$url$next" >"$html"

	pup -f "$html" -p 'div.tgxtablerow > div:nth-child(11) > span > font:first-child text{}' >"$seeds"

	# No results
	[ -s "$seeds" ] || return 1

	pup -f "$html" -p 'div.tgxtablerow > div:nth-child(8) > span text{}' | tr -d ' ' >"$sizes"
	pup -f "$html" -p 'div.tgxtablerow > div:nth-child(4) > div > a attr{title}' >"$names"
	pup -f "$html" -p 'div.tgxtablerow > div:nth-child(5) > a:nth-child(2) attr{href}' >"$links"

	paste "$sizes" "$seeds" "$names" >"$results"
}
