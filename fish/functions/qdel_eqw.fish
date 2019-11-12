function qdel_eqw
	qstat | grep -e " Eqw " | awk '{print $1}' | xargs -I xxx qdel xxx
end
