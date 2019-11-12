function uniqueone
	awk "{print $1}" $argv | sort | uniq
end
