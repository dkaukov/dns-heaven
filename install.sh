#!/bin/bash

set -e

TARGET=/usr/local/bin/dns-heaven
PLIST=/Library/LaunchDaemons/com.greenboxal.dnsheaven.plist

curl -L -o $TARGET https://github.com/dkaukov/dns-heaven/releases/download/v1.2/dns-heaven_1.2_darwin_all
chmod +x $TARGET

cat > $PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.greenboxal.dnsheaven</string>
    <key>ProgramArguments</key>
    <array>
        <string>$TARGET</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

chmod 644 $PLIST
launchctl load -w $PLIST

