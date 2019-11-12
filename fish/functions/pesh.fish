function pesh
	finderror $argv | sed 's/e$/sh/g' | tr '\n' ' ' | awk '{print "tail -n +1 " $0}' | bash
end
