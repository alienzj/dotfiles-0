function snakeinit --argument begin assembler samples
	python /ldfssz1/ST_META/share/User/zhujie/toolkit/metapi/metapi/core.py init \
-d . \
-q st.q \
-p P18Z10200N0127 \
-b $begin \
-a $assembler \
-s $samples
end
