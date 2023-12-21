# "jit provisioning" (lol) for display link

bc it's screen recording requiements mess with stuff but also i need it sometimes

```bash
cp com.user.jitdisplaylink.plist ~/Library/LaunchAgents/
chmod 644 ~/Library/LaunchAgents/com.user.jitdisplaylink.plist
launchctl load ~/Library/LaunchAgents/com.user.jitdisplaylink.plist
```
