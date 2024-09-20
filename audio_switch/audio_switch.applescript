set the currentAudioSource to (do shell script "/opt/homebrew/bin/SwitchAudioSource -c")

try
	if currentAudioSource is equal to "JDS Labs Element DAC" then
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"USB-C to 3.5mm Headphone Jack Adapter\""
		display notification "SwitchAudioSource" with title "Desktop Speakers"
	else
		do shell script "/opt/homebrew/bin/SwitchAudioSource -s \"JDS Labs Element DAC\""
		display notification "SwitchAudioSource" with title "Headphone DAC"
	end if
on error
	display notification "SwitchAudioSource" with title "Source not found"
end try
