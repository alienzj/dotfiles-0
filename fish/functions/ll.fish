# Defined interactively
function ll --wraps=ls
exa -l $argv
end
