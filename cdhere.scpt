#!/usr/bin/osascript
on openTerminal(quoted_path)
	tell application "Terminal"
		tell application "System Events" to set terminalIsRunning to (name of processes) contains "Terminal"
		
		if terminalIsRunning then
			do script "cd " & quoted_path & "; clear"
		else
			set currentWindow to window 0
			do script "cd " & quoted_path & "; clear" in currentWindow
		end if
		
		activate
	end tell
end openTerminal


on getCurrentFinderLocation()
	tell application "Finder"
		return quoted form of POSIX path of (insertion location as text)
	end tell
end getCurrentFinderLocation

on run
	set qp to getCurrentFinderLocation()
	openTerminal(qp)
	return
end run

