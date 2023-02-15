#!/usr/bin/env bash
ytnotdir="$HOME/.local/share/yt-not"

get_notification()
{

    cat "${ytnotdir}/channels.yt-not" | \
    while read line
    do
        channelId="$(echo "$line" | awk '{print $1}')"
        ch_name="$(echo "$line" | awk '{print $2}')"
        pre_vId="$(echo "$line" | awk '{print $3}')"
        # Get last vid from xml feed
        new_vId="$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=${channelId}" | sed '/videoId/!d;s/^.*>\(.*\)<.*$/\1/g' | head -n1)"
        if [ "$new_vId" != "$pre_vId" ]
        then
            dunstify "yt-notify" "NEW VID!! from\n${ch_name}"
            newline=$(echo "$line" | sed "s/$pre_vId/$new_vId/")
            sed -i "s/$line/$newline/" "${ytnotdir}/channels.yt-not"
        fi
    done
}

# Two valid formats:
# 1: @channel
# 2: channelId @channel videoId
parse_channels()
{
    cat "${ytnotdir}/channels.yt-not" | \
    while read line
        do 
            # First word of line is channelId or channelTag
            chidot="$(echo "$line" | awk '{print $1}')"
            # Tags start with @
            if [ "${chidot::1}" == "@" ] 
            then
                # channel tag -> channelId
                channelId="$(curl -s "https://www.youtube.com/${chidot}" | pup 'meta[itemprop="channelId"] attr{content}')"
                sed -i "s/${chidot}/${channelId} ${chidot} novideo/" "${ytnotdir}/channels.yt-not"
            fi
        done
}

main()
{
    mkdir -p "${ytnotdir}"
    if [ ! -f "${ytnotdir}/channels.yt-not" ]
    then
        echo "@bugswriter_" > "${ytnotdir}/channels.yt-not"
        echo "@DistroTube" >> "${ytnotdir}/channels.yt-not"
        echo "@MentalOutlaw" >> "${ytnotdir}/channels.yt-not"
        echo "@Fireship" >> "${ytnotdir}/channels.yt-not"
    fi

    while true
    do
        sleep 15m
        parse_channels
        get_notification
    done
}

main
