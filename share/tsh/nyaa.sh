#!/bin/sh

# shellcheck disable=SC2154
# (we expect the variables to be set)

# $1`: line number used to get link
get_magnet() { sed -n "${1}p" "$links"; }

get_torrents() {
	base_url="https://nyaa.si"
	page="/?q=$query&p=1"
	i=0
	while true; do
		i=$((i + 1))
		page="$(curl -s "$base_url$page" | tee -a "$html" | pup -p 'li.next a attr{href}')"
		if [ -z "$page" ]; then
			printf '%s.\n' "$i"
			break
		else
			>&2 printf '%s ' "$i"
		fi
	done
	# No results
	[ "$i" -eq 0 ] && return 1

	pup -f "$html" -p 'table.torrent-list tr td:nth-child(2) a:last-child attr{title}' >"$names"
	pup -f "$html" -p 'table.torrent-list tr td:nth-child(3) a:last-child attr{href}' >"$links"
	pup -f "$html" -p 'table.torrent-list tr td:nth-child(4) text{}' | tr -d ' ' >"$sizes"
	pup -f "$html" -p 'table.torrent-list tr td:nth-child(6) text{}' >"$seeds"

	paste "$sizes" "$seeds" "$names" >"$results"
}
