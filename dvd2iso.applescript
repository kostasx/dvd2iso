set filecount to 0

on open filelist
	repeat with i in filelist
		set filecount to 1
		tell application "Terminal"
			set filename to do shell script Â
				"perl -e \"print quotemeta ('" & POSIX path of i & "');\""
			do script "hdiutil makehybrid -udf-volume-name MYDVD -o " & filename & "mydvd.iso " & filename
		end tell
	end repeat
end open

if filecount < 1 then
	tell application "Terminal"
		do script "exit;"
	end tell
end if