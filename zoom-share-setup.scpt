set theApp to "zoom.us"
set external_top_left to {1290, -1000} -- top left -- rename these, set proper coordinates.  maybe get from existing windows?
set external_top_left_lower to {582, -998}

if application theApp is not running then
	return "app isn't running"
end if

tell application theApp
	activate
end tell

tell application "System Events"
	set myList to name of windows of (processes whose name is "zoom.us") -- get a list of lists, each sublist contains names 
end tell

set theWindowList to my subListsToOneList(myList) --  Flattening a list of lists

on subListsToOneList(x)
	set newL to {}
	repeat with i in x
		set newL to newL & i
	end repeat
	set theWindowList to newL
end subListsToOneList

-- return theWindowList
-- {"Zoom Meeting ID: 713-468-643", "Zoom"} :: brian sharing, lesson / gallery.  me not sharing.  Meeting = gallery view
-- {"Sharing Frame Window", "", "", "", "", "Zoom"} RIGHT AWAY me actively sharing.  Meeting = gallery view
-- {"Sharing Frame Window", "", "", "Zoom"} AFTER A SEC me actively sharing.  Meeting = gallery view

repeat with currentName in theWindowList
	if ((currentName as string) contains "Sharing Frame Window") then
		set shareStatus to true
		exit repeat
	else
		set shareStatus to false
	end if
end repeat

if shareStatus then
	-- return "sharing"
	-- end sharing
	tell application theApp
		activate
		tell application "System Events" to keystroke "s" using {command down, shift down}
		delay 0.5
	end tell
	tell application "System Events"
		tell application process theApp
			perform action "AXRaise" of (first window whose name contains "Meeting")
			set frontmost to true
		end tell
		tell application "BetterTouchTool"
			trigger_action "{\"BTTPredefinedActionType\":108}" -- resize to left 1/3
		end tell
	end tell
	tell application "System Events"
		tell application process theApp
			perform action "AXRaise" of (first window whose name is equal to "Zoom")
			set frontmost to true
		end tell
		tell application "BetterTouchTool"
			trigger_action "{\"BTTPredefinedActionType\":47}" -- move to other monitor
			trigger_action "{\"BTTPredefinedActionType\":175}" -- resize to right 2/3rd
		end tell
	end tell
	delay 30
	tell application "System Events"
		tell application process theApp
			perform action "AXRaise" of (first window whose name contains "Meeting")
			set frontmost to true
			tell application "System Events" to keystroke "w" using {command down, shift down}
		end tell
	end tell
	
	return "ended sharing"
else
	-- return "not sharing"
	-- start sharing
	tell application theApp
		activate
		tell application "System Events" to keystroke "s" using {command down, shift down}
		delay 0.5
	end tell
	
	tell application "System Events"
		tell application process theApp
			perform action "AXRaise" of (first window whose name contains "Select")
			delay 0.5
		end tell
	end tell
	
	repeat 10 times
		tell application "System Events" to key code 126 -- up
		tell application "System Events" to key code 123 -- left
	end repeat
	
	tell application "System Events" to key code 76 -- return
	delay 1.5
	
	tell application "System Events"
		tell application process theApp
			set bar to (first window whose name does not contain " ")
			set position of bar to external_top_left_lower
			set cameras to (second window whose name does not contain " ")
			set position of cameras to external_top_left_lower
		end tell
	end tell
	
	tell application "System Events"
		tell application process theApp
			set bar to (second window whose name does not contain " ")
			set position of bar to external_top_left_lower
			set cameras to (first window whose name does not contain " ")
			set position of cameras to external_top_left_lower
		end tell
	end tell
	
	return "started sharing"
end if

return "done"