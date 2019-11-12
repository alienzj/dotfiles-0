function supermem_test
	echo "echo hello" | qsub -S /bin/bash -cwd -binding linear:1 -q st_supermem.q -P st_supermem -l vf=50M,p=1
end
