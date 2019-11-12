function rmall --argument rmdir
	find $rmdir -maxdepth 1 | xargs -I xxx echo rm -rf xxx | tail -n +2 | asub.py
end
