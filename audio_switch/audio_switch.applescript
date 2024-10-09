set desktopSpeakers to "Hi-Res Audio"
set headPhones to "JDS Labs Element DAC"
set currentAudioSource to (do shell script "/opt/homebrew/bin/SwitchAudioSource -c")

try
	if currentAudioSource is equal to headPhones then
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"" & desktopSpeakers & "\""
		display notification "SwitchAudioSource" with title "Desktop Speakers"
	else
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"" & headPhones & "\""
		display notification "SwitchAudioSource" with title "Headphone DAC"
	end if
on error
	display notification "SwitchAudioSource" with title "Source not found"
end try
