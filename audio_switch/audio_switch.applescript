set the currentAudioSource to (do shell script "/opt/homebrew/bin/SwitchAudioSource -c")

try
	if currentAudioSource is equal to "JDS Labs Element DAC" then
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"AudioQuest DragonFly Black v1.5\""
		display notification "SwitchAudioSource" with title "AudioQuest DragonFly Black v1.5"
	else
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"JDS Labs Element DAC\""
		display notification "SwitchAudioSource" with title "JDS Labs Element DAC"
	end if
on error
	display notification "SwitchAudioSource" with title "Source not found"
end try
