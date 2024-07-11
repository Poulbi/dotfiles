#!/bin/sh

# Note(Author): This fails because the request after solving the captcha is blank.

# shellcheck disable=SC2154

# $1: line number for link that will provide magnet link
get_magnet() { curl -s "$(sed -n "${1}p" "$links")" | pup 'a.magnet-link attr{href}'; }

get_torrents() {
	cookies="$tmp"/cookies

	pass="$(find "$PASSWORD_STORE_DIR" -type f | sed -e '/rutracker\.org\//!d' -e "s@$PASSWORD_STORE_DIR/@@;s/\.gpg\$//")"
	username="${pass#*/}"
	password="$(pass show "$pass" | head -n 1)"

	curl -sL 'https://rutracker.org/forum/login.php' \
		-X POST --data-raw "login_username=$username&login_password=$password&login=вход" \
		-b "$cookies" --cookie-jar "$cookies" >"$html"

	# Check if user was blocked by captcha
	if pup 'img attr{src}' <"$html" | grep -q 'captcha'; then
		cap_link="$(pup -f "$html" 'img attr{src}' | grep 'captcha')"
		cap_code="$(pup -f "$html" 'input.reg-input attr{name}')"
		cap_sid="$(pup -f "$html" 'input[name="cap_sid"] attr{value}')"

		>&2 printf "cap_link: %s\n" "$cap_link"
		>&2 printf 'code: '
		code="$(head -n 1)"

		curl -sL 'https://rutracker.org/forum/login.php' \
			-X POST --data-raw "login_username=$username&login_password=$password&cap_sid=$cap_sid&$cap_code=$code&login=вход" \
			--cookie-jar "$cookies" >/dev/null
	fi

	curl -b "$cookies" -s 'https://rutracker.org/forum/tracker.php' \
		-X POST --data-raw "nm=$query" >"$html"
	pup -p -f "$html" 'tr td:nth-child(4) a:first-child text{}' >"$names"
	pup -f "$html" 'tr td:nth-child(6) a:first-child text{}' | awk '{print $1}' >"$sizes"
	pup -f "$html" 'tr td:nth-child(7) b text{}' >"$seeds"
	pup -f "$html" 'tr td:nth-child(4) a:first-child attr{href}' | sed 's#.*#https://rutracker.org/forum/&#' >"$links"
	paste "$sizes" "$seeds" "$names" >"$results"
}
