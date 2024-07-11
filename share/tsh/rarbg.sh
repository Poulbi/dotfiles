#!/bin/sh

url="https://www2.rarbggo.to"

# $1: line number to get link
get_magnet() { curl -s "$url/$(sed -n "${1}p" "$links")" | pup -p '#hvicwlo attr{href}'; }

get_torrents() {
	>&2 printf "$url/search/?search=$query"
	curl -s "$url/search/?search=$query" >"$html"

	row='table.tablelist2 > tbody > tr.table2ta > td.tlista'
	pup -p "$row:nth-child(2) > a text{}" <"$html" >"$names"
	pup -p "$row:nth-child(5) text{}" <"$html" | tr -d ' ' >"$sizes"
	pup -p "$row:nth-child(6) > font text{}" <"$html" >"$seeds"
	pup -p "$row:nth-child(2) > a attr{href}" <"$html" >"$links"
	paste "$sizes" "$seeds" "$names" >"$results"
}
