#!/usr/bin/env bash
nmcli -t -f active,ssid,signal,security dev wifi list | awk -F: '
BEGIN{print "["}
{
    if ($2=="") next
    active = ($1=="да" || $1=="yes") ? "true" : "false"
    secured = ($4=="--" || $4=="") ? "false" : "true"
    signal = $3

    if (($2 in seen) && active == "false") next
    if (($2 in seen) && seen[$2] == "true") next

    seen[$2] = active
    data[$2] = "{\"ssid\":\"" $2 "\",\"signal\":" signal ",\"secured\":" secured ",\"active\":" active "}"
}
END{
    n=0
    for (ssid in data) {
        if (n++>0) printf ",\n"
        printf "%s", data[ssid]
    }
    print "\n]"
}'
