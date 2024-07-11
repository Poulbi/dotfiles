#!/bin/sh

url="https://www.1337xx.to"
# shellcheck disable=SC2154
# (we expect the variables to be set)

# $1: line number used to get link
get_magnet() {
	curl -s "$(sed -n "${1}p" "$links")" |
		pup -p 'a attr{href}' | grep "^magnet:" | head -n 1
}

get_torrents() {
	# Get the pages all in one html document
	next="/search/$query/1/"
	while [ "$next" ]; do
		link="$url$next"
		>&2 printf '%s\n' "$link"

		# Get next link, but also append html
		next="$(
			curl -s "$link" |
				tee -a "$html" |
				pup -p 'div.pagination li:last-child a attr{href}'
		)"
		[ "$next" = 'javascript:void(0)' ] && break
	done
	# No results

	# parse html pages and scrape relevant information in seperate files
	pup -f "$html" -p 'td.seeds text{}' >"$seeds"
	# No results
	[ -s "$seeds" ] || return 1
	pup -f "$html" -p 'td.size text{}' | tr -d ' ' >"$sizes"
	pup -f "$html" -p 'td.name a:nth-child(2) text{}' >"$names"
	pup -f "$html" -p 'td.name a:nth-child(2) attr{href}' |
		awk "{print \"$url\" \$0}" >"$links"

	# concatenating the 3 files into results file
	paste "$sizes" "$seeds" "$names" >"$results"
}
