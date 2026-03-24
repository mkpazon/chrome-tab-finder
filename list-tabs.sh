#!/bin/bash
osascript -e '
tell application "Google Chrome"
  set o to ""
  repeat with w from 1 to (count of windows)
    repeat with t from 1 to (count of tabs of window w)
      set o to o & w & "|||" & t & "|||" & title of tab t of window w & "|||" & URL of tab t of window w & linefeed
    end repeat
  end repeat
  return o
end tell' 2>/dev/null
