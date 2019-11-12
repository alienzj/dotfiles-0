function total_st.q_task
	qstat -u \*  | tail -n +3 |  awk '{if($5=="r")print}' | awk '{print $(NF-1)}' | awk -F@ '{if($1=="st.q")print}' | wc -l
end
