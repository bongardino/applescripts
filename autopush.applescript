set vpnClientName to "mbongardino | engie | knockknock"
set viscosityWindowName to "Viscosity - " & vpnClientName
set afterWindowOpenDelay to 1

tell application "Viscosity"
	if the state of the second connection is not "Connected" then -- connection order based on when they were imported, and not how they are ordered in your viscosity prefs.  I think.
		disconnect vpnClientName
		delay 0.2
		connect vpnClientName
	end if
end tell

tell application "System Events"
	set duoPrompt to a reference to static text "Duo passcode or second factor:" of window viscosityWindowName of application process "Viscosity"
	set mfaInputField to a reference to text field of window viscosityWindowName of application process "Viscosity"
	set okButton to a reference to button "OK" of window viscosityWindowName of application process "Viscosity"

	repeat until exists duoPrompt
		delay 0.2
	end repeat
	delay afterWindowOpenDelay -- This delay is annoying, but important. The push is never sent without it
	set value of mfaInputField to "push"
	click okButton
end tell
