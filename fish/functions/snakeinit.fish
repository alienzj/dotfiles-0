function snakeinit --argument begin assembler samples
	python ~/projects/metapi/metapi/corer.py init \
-d . \
-q st.q \
-p P18Z10200N0127 \
-b $begin \
-a $assembler \
-s $samples
end
