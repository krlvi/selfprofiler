#!/bin/bash

get_foreground_osx() {
  osascript -e '
      global frontApp, frontAppName, windowTitle
      set windowTitle to ""
      tell application "System Events"
          set frontApp to first application process whose frontmost is true
          set frontAppName to name of frontApp
          if exists (window 1 of process frontAppName whose value of attribute "AXMain" is true) then
              tell process frontAppName
                tell (1st window whose value of attribute "AXMain" is true)
                  set windowTitle to value of attribute "AXTitle"
                end tell
              end tell
          else
              set windowTitle to "N/A"
          end if
      end tell
      return {frontAppName, windowTitle}
  '
}

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo 'Only OSX is currently supported'
    exit 1
fi

print_row() {
    app=$(echo $1 | awk -F', ' '{print $1}')
    label=$(echo $1 | awk -F', ' '{print $2}')
    ph=$2
    echo '{"name": "'$label'", "cat": "'$app'", "ph": "'$ph'", "pid": "HUMAN", "tid": "'$app'", "ts": '$timestamp'},'
}

timestamp=0
fg=""
if [[ "$1" != "--resume" ]]; then
	echo '['
fi
while true; do
    new=$(get_foreground_osx)
    if [[ "$new" != "$fg" ]]; then
        if [[ "$fg" != "" ]]; then
            print_row "$fg" E
        fi
        if [[ "$new" != "" ]]; then
            print_row "$new" B
        fi
        fg=$new
    fi
    timestamp=$((timestamp + 1000000))
    sleep 1
done
