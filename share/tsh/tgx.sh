#!/bin/sh

html="tmp.html"
query="battleblock"

url="https://torrentgalaxy.mx"

curl "$url/galaxyfence.php?f&dropoff=%2Ftorrents.php%3Fsearch%3D$query" > "$html"

captcha_url="$url/$(pup -p '#captcha attr{src}' < "$html")"

if [ "$captcha_url" ]
then
    >&2 printf "> "
    curl "$captcha_url" | imv -
    captcha_value="$(head -n 1)"
    >&2 printf "captcha_value: %s\n" "$captcha_value"

    curl -v "$url/galaxyfence.php" \
        --compressed \
        -X POST \
        --data-raw "dropoff=%2Ftorrents.php%3Fsearch%3D$query&captcha=$captcha_value" \
        > result.html
fi

$BROWSER result.html
