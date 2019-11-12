function printerror
	finderror $argv | tr '\n' ' ' | awk '{print "tail -n +1 " $0}' | bash
end
