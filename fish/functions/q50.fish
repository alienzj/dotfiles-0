function q50
	qsub -S /bin/bash -cwd -binding linear:1 -q st.q -P P18Z10200N0127 -l vf=50M,p=1 $argv
end
