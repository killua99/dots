# Defined in - @ line 0
function cls --description alias\ cls\ clear\;\ printf\ \'\\033\[3J\'
	clear; printf '\033[3J' $argv;
end
