do shell script "pushd ~/Downloads; curl -O https://s3.amazonaws.com/pdpartner/PagerDuty+Outgoing+Numbers.vcf; open PagerDuty+Outgoing+Numbers.vcf; popd"

delay 1

tell application "System Events" to keystroke return

tell application "Contacts"
	quit
end tell

do shell script "pushd ~/Downloads; rm PagerDuty+Outgoing+Numbers.vcf; popd"
