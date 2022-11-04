#!/bin/bash

set -e

TARGET=/usr/local/bin/dns-heaven
PLIST=/Library/LaunchDaemons/com.greenboxal.dnsheaven.plist

launchctl unload  $PLIST

rm $PLIST
rm $TARGET


