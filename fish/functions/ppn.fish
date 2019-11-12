function ppn --description 'print specific line number' --argument linenum filename
	awk -v num=$linenum '$NR==$num{print}' $filename
end
