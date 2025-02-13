1. brew install switchaudio-osx

2. run `SwitchAudioSource -a` in your shell to see what your devices are named

2. update the vars in `audio_switch.applescript` to match the devices you want to toggle between

3. Validate / enable notifications
    - open Script Editor.app, copy in applescript contents and run it.  
    - Your audio device should switch, and you'll get a notification banner. Make sure you then allow notifications from Script Editor in system prefs (this won't be an option unless you've generated a notification w Script Editor at least once)

3. create a service/quick action in automator
    - select Run Applescript, default settings are fine
    - copy the content in `audio_switch.applescript` into the run Applescript window
    - click the hammer to make sure it compiles
    - save to `~/Library/Services/`
    - file ext should be `.workflow` (Quick Action)
    - set a hotkey in sysprefs / keyboard / shortcuts / General / services to that automator service

4. if it doesn't work after setting the service hotkey
    - try giving automator and / or script editor accessiblity access in Security & Privacy
    - idk reboot
