#!/usr/bin/env bash

function usb_device_connected {
  system_profiler SPUSBDataType | grep -q "DisplayLink"
}

function displaylink_manager_running {
  pgrep -u "$(whoami)" -f "DisplayLink" > /dev/null
}

function start_displaylink_manager {
  open -a "DisplayLink Manager"
}

function stop_displaylink_manager {
  pkill -x "DisplayLinkUserAgent"
}

# main
if usb_device_connected; then
  if ! displaylink_manager_running; then
    start_displaylink_manager
  fi
else
  if displaylink_manager_running; then
    stop_displaylink_manager
  fi
fi
