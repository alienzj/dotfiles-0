function st.q_node_list
	qstat -u \*  | tail -n +3 | awk -F'[ @]+' '$5=="r" && $8=="st.q" {print $9}' | awk -F'.' '{print $1}' | sort -V | uniq
end
