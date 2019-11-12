function get_all_flagstats
	find $argv -maxdepth 2 -mindepth 2 -type f -name "*.flagstat"
end
