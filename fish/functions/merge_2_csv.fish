function merge_2_csv --description 'merge two csv/tsv with same header' --argument csv_1 csv_2
	awk 'FNR == 1 && NR != 1 {next;}{print}' $csv_1 $csv_2
end
