-- created a service in automator, set a hotkey
-- http://apetronix.com/switch-audio-outputs-with-a-keyboard-shortcut-on-os-x/#:~:text=If%20you%20frequently%20switch%20between,and%20change%20the%20output%20device.

set the currentAudioSource to (do shell script "/usr/local/bin/SwitchAudioSource -c")

try
  if currentAudioSource is equal to "FiiO USB DAC-E10" then
    do shell script "/usr/local/bin/SwitchAudioSource -s \"AudioQuest DragonFly Black v1.5\""
    display notification "SwitchAudioSource" with title "AudioQuest DragonFly Black v1.5"
  else
    do shell script "/usr/local/bin/SwitchAudioSource -s \"FiiO USB DAC-E10\""
    display notification "SwitchAudioSource" with title "FiiO USB DAC-E10"
  end if
on error
  display notification "SwitchAudioSource" with title "Source not found"
end try
