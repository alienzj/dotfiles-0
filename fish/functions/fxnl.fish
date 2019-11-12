function fxnl
	bioawk -cfastx '{print $name, length($seq)}' $argv
end
